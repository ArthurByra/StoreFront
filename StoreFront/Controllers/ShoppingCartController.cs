using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using StoreFront.Models;
using StoreFront.ViewModels;

namespace StoreFront.Controllers
{
    public class ShoppingCartController : Controller
    {
        StoreFrontContext db = new StoreFrontContext();

        [Authorize]
        public ActionResult Index(int ProdID) //grab cartproducts using shoppingcartid from userid?
        {
            using (db)
            {
                var findShoppingCart = db.ShoppingCarts.Where(x => x.UserID == (int)Session["UserID"]);
                var getShoppingID = findShoppingCart.Select(s => s.ShoppingCartID);
            }

            return View();
        }

        [Authorize]
        public PartialViewResult Remove()
        {
            using (db)
            {

            }

            return PartialView();
        }

        [Authorize]
        public PartialViewResult Update()
        {
            using (db)
            {
                db.SaveChanges();
            }

            return PartialView();
        }
    }
}