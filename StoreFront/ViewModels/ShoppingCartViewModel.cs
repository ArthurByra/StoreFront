using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using StoreFront.Models;

namespace StoreFront.ViewModels
{
    public class ShoppingCartViewModel : CustomerBaseViewModel
    {
        public List<ShoppingCartProductViewModel> ShoppingCartList { get; set; } = new List<ShoppingCartProductViewModel>();
    }

    public class ShoppingCartProductViewModel : ProductViewModel
    {
        public int Quantity { get; set; }
    }
}