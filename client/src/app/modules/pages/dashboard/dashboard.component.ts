import { AfterViewInit, Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.scss'],
})
export class DashboardComponent implements OnInit, AfterViewInit {
  paymentData: any;
  constructor() {}

  ngOnInit(): void {
    this.paymentData = JSON.parse(localStorage.getItem('paymentData'));
  }

  ngAfterViewInit(): void {
    document.body.classList.remove('accounts-bg');
    document.body.classList.remove('accounts-bg-pattern');
  }
}
