using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace StoreFront.ViewModels
{
    public class ProductViewModel
    {
        public int ProductID { get; set; }
        public string Name { get; set; }
        public decimal Price { get; set; }
        public string ImageFile { get; set; }
    }
}