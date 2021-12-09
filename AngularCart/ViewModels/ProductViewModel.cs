using AngularCart.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AngularCart.ViewModels
{
    public class ProductViewModel
    {
        public int ProductId { get; internal set; }
        public string ProductName { get; internal set; }
        public string Packaging { get; internal set; }
        public int CategoryId { get; internal set; }
        public string ProductImageUrl { get; internal set; }
        public int ProductCost { get; internal set; }
        public string CategoryName { get; internal set; }
        public int DeliveryCharges { get; internal set; }
        public ICollection<DiscountViewModel> Discounts { get; internal set; }
    }
}
