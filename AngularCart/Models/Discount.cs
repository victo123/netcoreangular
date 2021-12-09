using System;
using System.Collections.Generic;

namespace AngularCart.Models
{
    public partial class Discount
    {
        public Discount()
        {
            AppliedDiscount = new HashSet<AppliedDiscount>();
        }

        public int DiscountId { get; set; }
        public string DiscountName { get; set; }
        public string DiscountDescription { get; set; }

        public virtual ICollection<AppliedDiscount> AppliedDiscount { get; set; }
    }
}
