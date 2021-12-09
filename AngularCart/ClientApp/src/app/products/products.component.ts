import { Component, OnInit, Output, EventEmitter, Inject } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { ActivatedRoute } from '@angular/router';
import { of, Observable } from 'rxjs';
import { DataserviceService } from '../dataservice.service';

@Component({
  selector: 'app-product-data',
  templateUrl: './products.component.html'
})

export class ProductsComponent {
  @Output() ToCart = new EventEmitter<number>();
  products: Product[];
  tempProducts: Product[];
  categories: Category[];
  paramsObject;
  public TotalCount: number;
  constructor(private route: ActivatedRoute, http: HttpClient, @Inject('BASE_URL') baseUrl: string, private dataService: DataserviceService) {
    this.route.queryParamMap.subscribe((params) => {
      this.paramsObject = { ...params.keys, ...params };
    });
    http.get<Product[]>(baseUrl + 'product').subscribe(result => {
      this.products = result;
      this.tempProducts = result;
      this.products.forEach((p) => {
        p.count = 0;
      });
    }, error => console.error(error));
    http.get<Category[]>(baseUrl + 'product/category').subscribe(result => {
      this.categories = result;
    }, error => console.error(error));
  }

  ngOnInit() {
    this.route.queryParamMap.subscribe(params => {
      this.paramsObject = { ...params.keys, ...params };
      if (this.paramsObject.params.cat !== undefined && this.paramsObject.params.query !== undefined) {
        this.products = this.getProductByCategoryAndQuery(this.tempProducts, this.paramsObject.params.cat, this.paramsObject.params.query);
      } else if (this.paramsObject.params.cat !== undefined && this.paramsObject.params.query === undefined) {
        this.products = this.getProductByCategory(this.tempProducts, this.paramsObject.params.cat);
      } else if (this.paramsObject.params.cat === undefined && this.paramsObject.params.query !== undefined) {
        this.products = this.getProductByQuery(this.tempProducts, this.paramsObject.params.query);
      } else {
        this.products = this.tempProducts;
      }
    });
  }

  add(product: Product) {
    this.updateCart(product);
  }

  getProductByCategory(product: Product[], categoryId: number): Product[] {
    return product.filter(e => e.categoryId === Number(categoryId));
  }

  getProductByQuery(product: Product[], keyword: string): Product[] {
    return product.filter(e => e.productName.toLowerCase().includes(keyword.toLowerCase()));
  }

  getProductByCategoryAndQuery(product: Product[], categoryId: number, keyword: string): Product[] {
    return product.filter(e => e.categoryId === Number(categoryId) && e.productName.toLowerCase().includes(keyword.toLowerCase()));
  }

  updateCart(product: Product) {
    this.dataService.setCountValue(product);
  }
}

export interface Product {
  productId: number;
  productName: string;
  packaging: string;
  categoryId: number;
  productImageUrl: string;
  productCost: number;
  categoryName: string;
  deliveryCharges: number;
  discounts: Discount[];
  totalDiscount: number;
  count: number;
  totalPriceToPay: number;
}

export interface Discount {
  discount: number;
  discountName: string;
}

export interface Category {
  id: number;
  categoryName: string;
  delivery: number;
}
