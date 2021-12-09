using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AngularCart.ViewModels
{
    public class CategoryViewModel
    {
        public int id { get; internal set; }
        public string CategoryName { get; internal set; }
        public int Delivery { get; internal set; }
    }
}
