import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Router } from '@angular/router';

@Component({
  selector: 'app-menu',
  templateUrl: './menu.component.html'
})

export class MenuComponent implements OnInit {
  // Create the objects for the classes related to store contact data
  public Menu: object[] = new Array();

  // Store the value to be shown if the database can't be reached
  public EmptyMenu = "The menu is not avaible at the moment. Please try again later, and thank you for your patience.";

  /*
   * Error: Store the value to define the visibility for error message element
   * ErrorMessage: Store the value to define the message to be shown on the error message element
  */
  public Error: boolean = false;
  public ErrorMessage: string = "";

  // Create the constructor for Router and HttpClient
  constructor(private router: Router, private http: HttpClient) { }

  ngOnInit() {
    // Define the http  for getting the menu from the database
      this.http.post('https://localhost:44305/' + 'MenuApi', null)
        .subscribe({
          next: data => {
            // Set the Status for the sent message element's visibility
            this.Error = false;

            // Store the result of the menu what has 
            this.Menu = data['data'];
          },
          error: error => {
            // Set the Status for the error message element's visibility
            this.Error = true;
            // Set the status message for the error message element's text
            this.ErrorMessage = error['text'];
          }
        });
  }
}
