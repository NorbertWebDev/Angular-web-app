import { Component, ViewChild, OnInit } from '@angular/core';
import { NgForm, FormsModule } from '@angular/forms';
import { HttpClient } from '@angular/common/http';
import { Router } from '@angular/router';

@Component({
  selector: 'app-booking',
  templateUrl: './booking.component.html'
})

export class BookingComponent implements OnInit {
  // Define the ViewChild and give the parameters specified below
  @ViewChild('booking', { static: false }) booking: NgForm;

  // Create the objects for the classes related to store booking data
  public BookingItem: BookingItem;
  public Booking: Object = {};

  /*
   * Status: Store the value to define the visibility for sent message element
   * StatusMessage: Store the value to define the message to be shown on the sent message element
  */
  public Status: boolean = false;
  public StatusMessage: string = "";

  /*
   * Error: Store the value to define the visibility for error message element
   * ErrorMessage: Store the value to define the message to be shown on the error message element
  */
  public Error: boolean = false;
  public ErrorMessage: string = "";

  // Create the constructor for Router and HttpClient
  constructor(private router: Router, private http: HttpClient) { }

  // Create the BookingItem(Booking) object on the initialization of the contact component
  ngOnInit() {
    this.BookingItem = {
      FullName: "",
      Email: "",
      PhoneOrMobile: "",
      Date: "",
      Time: "",
      Persons: 0,
      Message: "",
    };
  }

  // Define the function for the action of the booking form on the UI
  BookingCreate() {
    this.http.post<BookingItem>('https://localhost:44305/' + 'BookingApi', this.booking.value)
      .subscribe({
        next: data => {
          // Set the Status for the sent message element's visibility
          this.Status = true;
          // Set the status message for the sent message element's text
          this.StatusMessage = data['text'];

          // Reset the whole booking form instead the message elements too
          this.booking.resetForm();
        },
        error: error => {
          // Set the Status for the error message element's visibility
          this.Error = false;
          // Set the status message for the error message element's text
          this.ErrorMessage = error['text'];
        }
      });
  }
}

// Use the Booking interface and create the final class to store data for booking data
export class BookingItem implements Booking {
  FullName: string;
  Email: string;
  PhoneOrMobile: string;
  Date: string;
  Time: string;
  Persons: number;
  Message: string;
}

// Create the interface for Booking to store the related data in it
interface Booking {
  FullName: string;
  Email: string;
  PhoneOrMobile: string;
  Date: string;
  Time: string;
  Persons: number;
  Message: string;
}
