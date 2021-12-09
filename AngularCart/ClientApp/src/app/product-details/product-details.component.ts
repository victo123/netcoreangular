import { Component, OnInit,Output, EventEmitter,Inject } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { DataserviceService } from '../dataservice.service';
import { ActivatedRoute } from '@angular/router';
import { Product } from '../products/products.component';

@Component({
  selector: 'app-product-details',
  templateUrl: './product-details.component.html'
})

export class ProductDetailsComponent {
  private sub: any;
  product: Product;
  public TotalCount: number;

  constructor(
    private route: ActivatedRoute,
    private dataService: DataserviceService,
    private http: HttpClient,
    @Inject('BASE_URL') private baseUrl: string
  ) {

  }

  ngOnInit() {
    this.sub = this.route.params.subscribe((params) => {
      const id = params.id;
      this.http.get<Product>(this.baseUrl + 'product/' + id).subscribe(result => {
        this.product = result;
        this.product.count = 0;
      }, error => console.error(error));
    });
  }

  add(product: Product) {
    this.updateCart(product);
  }

  updateCart(product: Product) {
    this.dataService.setCountValue(product);
  }
}
