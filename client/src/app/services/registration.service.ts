import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { map } from 'rxjs/operators';

@Injectable({
  providedIn: 'root',
})
export class RegistrationService {
  constructor(private http: HttpClient) {}

  register(payload) {
    return this.http
      .post<any>(`http://localhost:9090/api/register`, payload)
      .pipe(
        map((paymentId) => {
          if (paymentId) {
            return paymentId;
          }
        })
      );
  }
}
