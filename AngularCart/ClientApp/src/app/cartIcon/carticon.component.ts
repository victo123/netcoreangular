import { Component, Input } from '@angular/core';
import { Product, Discount } from '../products/products.component';
import { DataserviceService } from '../dataservice.service';

@Component({
  selector: 'cart-icon-component',
  templateUrl: './carticon.component.html',
  styleUrls: ['./carticon.component.css']
})
export class CarticonComponent {
  public ProductsSelected: Product[];
  constructor(private dataService: DataserviceService) { }

  getTotalDiscountForProduct(product: Product) {
    var totalDiscount = 0;
    product.discounts.forEach((d: Discount) => { totalDiscount += product.productCost * d.discount / 100 });
    return totalDiscount;
  }

  getProductsTotalCost() {
    var totalCost = 0;
    this.ProductsSelected.forEach(r => { totalCost += r.count * r.productCost; })
    return totalCost;
  }

  getProductsTotalCostToPay(discount) {
    var totalDiscount = 0;
    var totalCost = 0;
    this.ProductsSelected.forEach(r => { totalDiscount += r.count * this.getTotalDiscountForProduct(r); totalCost += r.count * r.productCost; })
    if (discount != null || discount != undefined) {
      return (this.getProductsTotalCost() - totalDiscount) - (this.getProductsTotalCost() - totalDiscount) * discount;
    }
    return this.getProductsTotalCost() - totalDiscount;
  }

  getProductDeliveryChargesTotal(discount) {
    var totalDelivery = 0;
    this.ProductsSelected.forEach(r => { totalDelivery += r.count * r.deliveryCharges; })
    if (discount != null || discount != undefined) {
      return totalDelivery - totalDelivery * discount;
    }
    return totalDelivery;
  }

  public getOffersText = function (discounts: Discount[]) {
    var totalDiscountPercent = 0;
    discounts.forEach((d) => { totalDiscountPercent += d.discount; });
    return totalDiscountPercent + "% Off " + discounts.filter(r => r.discount > 0).length + " offers applied";
  }

  ngDoCheck() {
    console.log("called docheck from carticon");
    var products = this.dataService.getProductsSelectedValue();
    if (products!=null) {
      this.ProductsSelected = products.filter(r => r.count > 0);
    }
  }

  substract(product: Product) {
    if (product.count > 0) {
      product.count--;
      this.update();
    }
  }

  add(product: Product) {
    product.count++;
    this.update();
  }

  update() {
    if (this.ProductsSelected != null) {
      var found = this.ProductsSelected.filter(r => r.count > 0);
      this.dataService.setCounterValue(found.length);
    }
    else {
      this.dataService.setCounterValue(0);
    }
  }
}
