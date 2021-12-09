import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http';
import { RouterModule } from '@angular/router';

import { AppComponent } from './app.component';
import { NavMenuComponent } from './nav-menu/nav-menu.component';
import { HomeComponent } from './home/home.component';
import { ProductsComponent } from './products/products.component';
import { CarticonComponent } from './cartIcon/cartIcon.component';
import { DataserviceService } from './dataservice.service';
import { ProductDetailsComponent } from './product-details/product-details.component';
import { CheckoutComponent } from './checkout/checkout.component';

@NgModule({
  declarations: [
    AppComponent,
    NavMenuComponent,
    HomeComponent,
    ProductsComponent,
    CarticonComponent,
    ProductDetailsComponent,
    CheckoutComponent
  ],
  imports: [
    BrowserModule.withServerTransition({ appId: 'ng-cli-universal' }),
    HttpClientModule,
    FormsModule,
    RouterModule.forRoot([
      { path: '', component: HomeComponent, pathMatch: 'full' },
      { path: 'buyproduct', component: ProductsComponent},
      { path: 'buyproduct/:id', component: ProductDetailsComponent },
      { path: 'buyproduct/:id/:id2', component: ProductDetailsComponent },
      { path: 'cart', component: CarticonComponent },
      { path: 'productdetail/:id', component: ProductDetailsComponent },
      { path: 'checkout', component: CheckoutComponent }
    ])
  ],
  providers: [DataserviceService],
  bootstrap: [AppComponent]
})
export class AppModule { }
