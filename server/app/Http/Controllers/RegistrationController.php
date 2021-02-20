<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\{Customer, Transaction, BankAccount};
use GuzzleHttp\{Client, TransferStats};

class RegistrationController extends Controller
{
    public function registerUser(Request $request)
    {
        $customer = Customer::create([
            'first_name'  => $request->customer['first_name'],
            'last_name'  => $request->customer['last_name'],
            'telephone'  => $request->customer['telephone'],
            'street'  => $request->customer['street'],
            'house_number'  => $request->customer['house_number'],
            'zip_code'  => $request->customer['zip_code'],
            'city' => $request->customer['city']
        ]);

        $bank_account = BankAccount::create([
            'customer_id' => $customer->id,
            'account_owner' => $request->bank_account['account_owner'],
            'iban' => $request->bank_account['iban']
        ]);
        $transaction = $this->sendPayment($bank_account);
        return $transaction;
    }

    public function sendPayment($bank_account)
    {
        $payment_data = [
            'customerId' => $bank_account->customer_id,
            'iban' => $bank_account->iban,
            'owner' => $bank_account->account_owner
        ];

        $client = new Client();
        $request = $client->post('https://37f32cl571.execute-api.eu-central-1.amazonaws.com/default/wunderfleet-recruiting-backend-dev-save-payment-data', [
            'headers' => [
                'Accept' => 'application/json',
                'Content-Type' => 'application/json',
            ],
            'body' => json_encode($payment_data),
            'on_stats' => function(TransferStats $stats){
                $time = $stats->getTransferTime();
            }
        ]);
        $status_code = $request->getStatusCode();
        $response = $request->getBody();
        $json_data = json_decode($response, true);
        $payment_data_id = $json_data['paymentDataId'];

        $transaction = Transaction::create([
            'customer_id' => $bank_account->customer_id,
            'payment_data_id' => $payment_data_id,
        ]);
        return  $transaction;
    }
}
