using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using StoreFront.Models;

namespace StoreFront.ViewModels
{
    public class ShoppingCartViewModel : CustomerBaseViewModel
    {
        public List<ShoppingCartResults> ShoppingCartItems { get; set; }

        public ShoppingCartViewModel()
        {
            ShoppingCartItems = new List<ShoppingCartResults>();
        }
    }

    public class ShoppingCartResults
    {
        public string Name { get; set; }
        public decimal Price { get; set; }
        public string ImageFile { get; set; }
        public int Quantity { get; set; }
    }
}