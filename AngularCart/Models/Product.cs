using System;
using System.Collections.Generic;

namespace AngularCart.Models
{
    public partial class Product
    {
        public Product()
        {
            AppliedDiscount = new HashSet<AppliedDiscount>();
        }

        public int ProductId { get; set; }
        public string ProductName { get; set; }
        public int ProductCost { get; set; }
        public int CategoryId { get; set; }
        public string ProductImageUrl { get; set; }
        public string Packaging { get; set; }

        public virtual ProductCategory Category { get; set; }
        public virtual ICollection<AppliedDiscount> AppliedDiscount { get; set; }
    }
}
