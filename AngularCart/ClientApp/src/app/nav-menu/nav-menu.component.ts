import { Component } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { DataserviceService } from '../dataservice.service';

@Component({
  selector: 'app-nav-menu',
  templateUrl: './nav-menu.component.html',
  styleUrls: ['./nav-menu.component.css']
})
export class NavMenuComponent {
  datasubmit = {cat: '', query: ''};
  isExpanded = false;

  public cartValue = 0;
  constructor(private route: ActivatedRoute,private router: Router ,private dataService: DataserviceService) {
    this.route.queryParamMap.subscribe((params) => {
      this.datasubmit.cat = params.get('cat');
    });
  }

  ngOnInit() {
    this.route.queryParamMap.subscribe((params) => {
      this.datasubmit.cat = params.get('cat');
    });
  }
  
  collapse() {
    this.isExpanded = false;
  }

  toggle() {
    this.isExpanded = !this.isExpanded;
  }

  ngDoCheck() {
    //console.log("called docheck from nav");
    this.cartValue = this.dataService.getCountValue();
  }
  
  submitForm() {
    console.log('this.datasubmit');
    console.log(this.datasubmit);
    console.log('..............');
    this.router.navigate(['/buyproduct'], { queryParams: { id: this.datasubmit.cat, query: this.datasubmit.query } });
    //this.router.navigate(['/', { cat: "1", query: "Ripe" }]);
  }  
}
