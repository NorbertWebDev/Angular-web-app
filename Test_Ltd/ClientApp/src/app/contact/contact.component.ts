import { Component, ViewChild, OnInit } from '@angular/core';
import { NgForm, FormsModule } from '@angular/forms';
import { HttpClient } from '@angular/common/http';
import { Router } from '@angular/router';

@Component({
  selector: 'app-contact',
  templateUrl: './contact.component.html'
})

export class ContactComponent implements OnInit   {
  // Define the ViewChild and give the parameters specified below
  @ViewChild('contact', { static: false }) contact: NgForm;

  // Create the objects for the classes related to store contact data
  public ContactItem: ContactItem;
  public Contact: Object = {};

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

  // Create the ContactItem(Contact) object on the initialization of the contact component
  ngOnInit() {
    this.ContactItem = {
      FullName: "",
      Email: "",
      Subject: "",
      Message: "",
    };
  }

  // Define the function for the action of the contact form on the UI
  ContactCreate() {
    this.http.post<ContactItem>('https://localhost:44305/' + 'ContactApi', this.contact.value)
      .subscribe({
        next: data => {
          // Set the Status for the sent message element's visibility
          this.Status = true;
          // Set the status message for the sent message element's text
          this.StatusMessage = data['text'];

          // Reset the whole contact form instead the message elements too
          this.contact.resetForm();
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

// Use the Contact interface and create the final class to store data for contact data
export class ContactItem implements Contact {
  FullName: string;
  Email: string;
  Subject: string;
  Message: string;
}

// Create the interface for Contact to store the related data in it
interface Contact {
  FullName: string;
  Email: string;
  Subject: string;
  Message: string;
}
