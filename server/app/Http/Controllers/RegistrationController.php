<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Validator;
use App\Models\{Customer, Transaction, BankAccount};
use GuzzleHttp\{Client, TransferStats};

class RegistrationController extends Controller
{
    /**
     * @OA\Post(
     *     path="/register",
     *     summary="Register customer",
     *     description="Register's a new customer",
     *     tags={"Register Customer"},
     *     @OA\RequestBody(
     *         required = true,
     *         description="test",
     *         @OA\JsonContent(
     *             type="object",
     *             @OA\Property(
     *                 property="bank_account",
     *                 type="object",
     *                 example = {"account_owner": "John Doe", "iban": "DE75512108001245126188"}
     *             ),
     *             @OA\Property(
     *                 property="customer",
     *                 type="object",
     *                 example={"first_name": "John","last_name": "Doe","telephone": "017255860000","street": "Clara Zetkin Str 107","house_number": "WE09","zip_code": "99099","city": "Erfurt"}
     *             )
     *         ),
     *     ),
     *     @OA\Response(
     *         description="Register user",
     *         response=201, 
     *     )
     * )
     */   
    public function registerUser(Request $request)
    {   
        // validate customer data
        $customer_validator = Validator::make($request->customer, [
            'first_name' => 'required',
            'last_name' => 'required',
            'telephone' => 'required',
            'street' => 'required',
            'house_number' => 'required',
            'zip_code' => 'required',
            'city' => 'required',
        ]);

        // validate bank data
        $bank_account_validator = Validator::make($request->bank_account,[
            'account_owner' => 'required',
            'iban' => 'required'
        ]);

        // validation error response
        if($customer_validator->fails()){
            $validator = $customer_validator->errors(); 
            return response()->json($validator, 422);
        }
        if($bank_account_validator->fails()){
            $validator = $bank_account_validator->errors(); 
            return response()->json($validator, 422);
        }

        // check if telephone exists
        if($this->checkCustomer($telephone = $request->customer['telephone'])){
            return response()->json("Customer with telephone: $telephone exists!",422);
        }

        // check if iban exists
        if($this->checkIban($iban = $request->bank_account['iban'])){
            return response()->json("Customer with IBAN: $iban exists!",422);
        }

        DB::transaction(function() use ($request, &$transaction){
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
        });
        return $transaction;
    }

    /**
     * check if a customer with telephone number exists
     */
    public function checkCustomer($telephone){
        $customer = Customer::where('telephone', $telephone)->exists();
        return $customer ? true : false;
    }

    /**
     * check if customer with iban exists.
     */
    public function checkIban($iban){
        $bank_account = BankAccount::where('iban', $iban)->exists();
        return $bank_account ? true : false;
    }

    /**
     * send customer id to remote api
     */
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
