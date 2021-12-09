using System;
using System.Collections.Generic;

namespace AngularCart.Models
{
    public partial class AppliedDiscount
    {
        public int AppliedDiscountId { get; set; }
        public int DiscountId { get; set; }
        public int ProductId { get; set; }
        public int Discount { get; set; }

        public virtual Discount DiscountNavigation { get; set; }
        public virtual Product Product { get; set; }
    }
}
