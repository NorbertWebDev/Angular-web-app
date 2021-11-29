import { BrowserModule } from '@angular/platform-browser';
import { NgModule} from '@angular/core';
import { APP_BASE_HREF } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
import { RouterModule, Router } from '@angular/router';

import { AppComponent } from './app.component';
import { NavMenuComponent } from './nav-menu/nav-menu.component';
import { HomeComponent } from './home/home.component';
import { AboutComponent } from './about/about.component';
import { MenuComponent } from './menu/menu.component';
import { SpecialsComponent } from './specials/specials.component';
import { GalleryComponent } from './gallery/gallery.component';
import { ChefsComponent } from './chefs/chefs.component';
import { ContactComponent } from './contact/contact.component';
import { BookingComponent } from './booking/booking.component';

@NgModule({
  declarations: [
    AppComponent,
    NavMenuComponent,
    HomeComponent,
    AboutComponent,
    MenuComponent,
    SpecialsComponent,
    GalleryComponent,
    ChefsComponent,
    ContactComponent,
    BookingComponent
  ],
  imports: [
    BrowserModule.withServerTransition({ appId: 'ng-cli-universal' }),
    HttpClientModule,
    FormsModule,
    RouterModule.forRoot([
      { path: '', component: HomeComponent, pathMatch: 'full' },
      { path: 'Home', component: HomeComponent, pathMatch: 'full' },
      { path: 'About', component: AboutComponent },
      { path: 'Menu', component: MenuComponent },
      { path: 'Specials', component: SpecialsComponent, pathMatch: 'full' },
      { path: 'Gallery', component: GalleryComponent, pathMatch: 'full' },
      { path: 'Chefs', component: ChefsComponent, pathMatch: 'full' },
      { path: 'Contact', component: ContactComponent, pathMatch: 'full' },
      { path: 'Booking', component: BookingComponent, pathMatch: 'full' },
    ])
  ],
  providers: [{ provide: APP_BASE_HREF, useValue: '/' }],
  bootstrap: [AppComponent]
})
export class AppModule { }
