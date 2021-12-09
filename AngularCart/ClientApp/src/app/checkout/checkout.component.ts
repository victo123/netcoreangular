import { Component } from '@angular/core';
import { Product } from '../products/products.component';
import { DataserviceService } from '../dataservice.service';
import { Router } from '@angular/router';

@Component({
  selector: 'checkout-component',
  templateUrl: './checkout.component.html',
  styleUrls: ['./checkout.component.css']
})
export class CheckoutComponent {
  public ProductsSelected: Product[];
  constructor(private dataService: DataserviceService, private router: Router ) { }
  public TotalBillAmmount: number = 0;
  public AddedTotalBillDiscout: boolean = false;
  ngDoCheck() {
    var products = this.dataService.getProductsSelectedValue();
    if (products != null) {
      this.ProductsSelected = products.filter(r => r.count > 0);
      this.ProductsSelected.forEach(r => {
        var totalDiscount = 0;
        r.discounts.forEach(d => { totalDiscount += d.discount; });
        r.totalDiscount = totalDiscount;
        r.totalPriceToPay = (r.productCost - (r.productCost * totalDiscount / 100) + r.deliveryCharges) * r.count;
        this.TotalBillAmmount += r.totalPriceToPay;
        if (this.TotalBillAmmount > 25000) {
          this.TotalBillAmmount = this.TotalBillAmmount - (this.TotalBillAmmount * 0.10);
          this.AddedTotalBillDiscout = true;
        }
      });
    }
  }

  pay() {
    this.dataService.clearProductsSelectedValue();
    this.router.navigate(['/buyproduct']);
  }
}
