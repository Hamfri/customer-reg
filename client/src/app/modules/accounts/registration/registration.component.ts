import { Component, OnInit, AfterViewInit } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { RegistrationService } from 'src/app/services/registration.service';

@Component({
  selector: 'app-registration',
  templateUrl: './registration.component.html',
  styleUrls: ['./registration.component.scss'],
})
export class RegistrationComponent implements OnInit, AfterViewInit {
  personalForm: FormGroup;
  addressForm: FormGroup;
  paymentForm: FormGroup;

  personalFormSubmitted: boolean = false;
  addressFormSubmitted: boolean = false;
  submitted: boolean = false;
  error: string = '';
  activeTab = 'personalInformation';

  constructor(
    private formBuilder: FormBuilder,
    private registrationService: RegistrationService,
    private router: Router,
    private activatedRoute: ActivatedRoute
  ) {}

  ngOnInit(): void {
    this.personalForm = this.formBuilder.group({
      firstName: [
        this.retrievePersonalInfo ? this.retrievePersonalInfo.first_name : '',
        Validators.required,
      ],
      lastName: [
        this.retrievePersonalInfo ? this.retrievePersonalInfo.last_name : '',
        Validators.required,
      ],
      telephone: [
        this.retrievePersonalInfo ? this.retrievePersonalInfo.telephone : '',
        Validators.required,
      ],
    });
    this.addressForm = this.formBuilder.group({
      street: [
        this.retrieveAddressInfo ? this.retrieveAddressInfo.street : '',
        Validators.required,
      ],
      houseNumber: [
        this.retrieveAddressInfo ? this.retrieveAddressInfo.house_number : '',
        Validators.required,
      ],
      zipCode: [
        this.retrieveAddressInfo ? this.retrieveAddressInfo.zip_code : '',
        Validators.required,
      ],
      city: [
        this.retrieveAddressInfo ? this.retrieveAddressInfo.city : '',
        Validators.required,
      ],
    });
    this.paymentForm = this.formBuilder.group({
      accountOwner: [
        this.retrievePaymentInfo ? this.retrievePaymentInfo.account_owner : '',
        Validators.required,
      ],
      iban: [
        this.retrievePaymentInfo ? this.retrievePaymentInfo.iban : '',
        Validators.required,
      ],
    });

    this.chooseTab();
  }

  ngAfterViewInit(): void {
    document.body.classList.add('accounts-bg');
    document.body.classList.add('accounts-bg-pattern');
  }

  // access form fields
  get personalInfo() {
    return this.personalForm.controls;
  }

  get addressInfo() {
    return this.addressForm.controls;
  }

  get paymentInfo() {
    return this.paymentForm.controls;
  }

  /**
   * checks if data has been filled in
   * tabs and pre-selects the next tab by
   * altering the value for activeTabs
   */
  chooseTab() {
    if (this.retrievePersonalInfo) {
      let personalInfo = Object.getOwnPropertyNames(this.retrievePersonalInfo)
        .length;
      if (!personalInfo) {
        this.activeTab = 'personalInformation';
      } else if (personalInfo) {
        this.activeTab = 'addressInformation';
      }

      if (this.retrieveAddressInfo) {
        let addressInfo = Object.getOwnPropertyNames(this.retrieveAddressInfo)
          .length;

        if (personalInfo && addressInfo) {
          this.activeTab = 'paymentInformation';
        }
      }
    }
  }

  /**
   *
   * @param tab string
   * activates tabs
   */
  activateTab(tab: string): void {
    this.activeTab = tab;
  }

  personalFormTab() {
    this.personalFormSubmitted = true;
    if (this.personalForm.invalid) {
      return;
    }

    const personalF = {
      first_name: this.personalInfo.firstName.value,
      last_name: this.personalInfo.lastName.value,
      telephone: this.personalInfo.telephone.value,
    };
    if (localStorage.getItem('personalInfo')) {
      localStorage.removeItem('personalInfo');
    }
    localStorage.setItem('personalInfo', JSON.stringify(personalF));
    this.activateTab('addressInformation');
  }

  addressFormTab() {
    this.addressFormSubmitted = true;
    if (this.addressForm.invalid) {
      return;
    }

    const addressF = {
      street: this.addressInfo.street.value,
      house_number: this.addressInfo.houseNumber.value,
      zip_code: this.addressInfo.zipCode.value,
      city: this.addressInfo.city.value,
    };
    if (localStorage.getItem('addressInfo')) {
      localStorage.removeItem('addressInfo');
    }
    localStorage.setItem('addressInfo', JSON.stringify(addressF));
    this.activateTab('paymentInformation');
  }

  paymentFormTab() {
    const paymentF = {
      account_owner: this.paymentInfo.accountOwner.value,
      iban: this.paymentInfo.iban.value,
    };
    if (localStorage.getItem('paymentInfo')) {
      localStorage.removeItem('paymentInfo');
    }
    localStorage.setItem('paymentInfo', JSON.stringify(paymentF));
  }

  /**
   * rehdrate personal information
   */
  get retrievePersonalInfo() {
    let personalInfo = localStorage.getItem('personalInfo');
    return JSON.parse(personalInfo);
  }

  /**
   * rehdrate address information
   */
  get retrieveAddressInfo() {
    let addressInfo = localStorage.getItem('addressInfo');
    return JSON.parse(addressInfo);
  }

  /**
   * rehdrate payment information
   */
  get retrievePaymentInfo() {
    let paymentInfo = localStorage.getItem('paymentInfo');
    return JSON.parse(paymentInfo);
  }

  onSubmit() {
    this.submitted = true;
    if (
      this.personalForm.invalid ||
      this.addressForm.invalid ||
      this.paymentForm.invalid
    ) {
      return;
    }
    let customer = {
      ...this.retrievePersonalInfo,
      ...this.retrieveAddressInfo,
    };
    let bank_account = this.retrievePaymentInfo;
    const payload = {
      customer,
      bank_account,
    };
    console.log(payload);
    this.submitted = true;
    this.registrationService.register(payload).subscribe(
      (response) => {
        console.log(response);
        if (localStorage.getItem('paymentData')) {
          localStorage.removeItem('paymentData');
        }
        localStorage.setItem('paymentData', JSON.stringify(response));
        // clear registration info
        localStorage.removeItem('personalInfo');
        localStorage.removeItem('addressInfo');
        localStorage.removeItem('paymentInfo');

        // navigate to dashboard
        this.router.navigate(['/pages/dashboard']);
      },
      (error) => {
        console.log(error);
        //this.error = error;
      }
    );
  }
}
