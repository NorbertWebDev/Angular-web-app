import { Component } from '@angular/core';

@Component({
  selector: 'app-nav-menu',
  templateUrl: './nav-menu.component.html'
})
export class NavMenuComponent {
  // Store the names for the items in the navigation list
  sRouteNames = ['Home','About','Menu','Specials','Events','Gallery','Chefs','Contact','Book a table'];
}
