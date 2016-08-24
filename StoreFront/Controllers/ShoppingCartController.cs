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
        public ActionResult Index()
        {
            using (db)
            {
                var user = db.Users.FirstOrDefault(x => x.UserName == HttpContext.User.Identity.Name);
                if (user == null) return RedirectToAction("Index", "Home");

                var cartModel = new ShoppingCartViewModel();

                var cart = user.ShoppingCarts.FirstOrDefault();
                if (cart != null)
                {
                    foreach(var item in cart.ShoppingCartProducts)
                    {
                        var product = new ShoppingCartProductViewModel
                        {
                            ProductID = item.Product.ProductID,
                            Name = item.Product.ProductName,
                            Price = item.Product.Price ?? 99999,
                            ImageFile = item.Product.ImageFile,
                            Quantity = item.Quantity ?? 0
                        };

                        cartModel.ShoppingCartList.Add(product);
                    }
                }

                return View(cartModel);    
            }
        }

        [Authorize]
        [HttpPost]
        public ActionResult getCartCount()
        {
            var user = db.Users.FirstOrDefault(x => x.UserName == HttpContext.User.Identity.Name);
            var cartCount = user.ShoppingCarts.FirstOrDefault() == null ? 0 :user.ShoppingCarts.FirstOrDefault().ShoppingCartProducts.Sum(x => x.Quantity);

                return Json(cartCount);
        }

        [Authorize]
        public ActionResult Add(int prodID)
        {
            var user = db.Users.FirstOrDefault(x => x.UserName == HttpContext.User.Identity.Name);

            using (db)
            {

                var shopCart = user.ShoppingCarts.FirstOrDefault();

                if (shopCart == null)
                {
                    shopCart = new ShoppingCart {UserID = user.UserID, DateCreated = DateTime.Now, CreatedBy = user.UserName };
                    db.ShoppingCarts.Add(shopCart);
                }

                if (shopCart.ShoppingCartProducts.Any(x => x.ProductID == prodID))
                {
                    var prod = shopCart.ShoppingCartProducts.Single(x => x.ProductID == prodID);
                    prod.Quantity++;
                }
                else
                {
                    shopCart.ShoppingCartProducts.Add(new ShoppingCartProduct { ProductID = prodID, Quantity = 1, DateCreated = DateTime.Now, CreatedBy = user.UserName });
                }

                db.SaveChanges();
            }

            var cartCount = user.ShoppingCarts.FirstOrDefault().ShoppingCartProducts.Sum(x => x.Quantity);

            return Json(cartCount);
        }

        [HttpPost]
        [Authorize]
        public ActionResult Remove(int prodID)
        {
            using (db)
            {
                var user = db.Users.FirstOrDefault(x => x.UserName == HttpContext.User.Identity.Name);

                var cart = user.ShoppingCarts.FirstOrDefault();

                var prod = cart.ShoppingCartProducts.Single(x => x.ProductID == prodID);

                cart.ShoppingCartProducts.Remove(prod);
                db.SaveChanges();

                var cartCount = user.ShoppingCarts.FirstOrDefault().ShoppingCartProducts.Sum(x => x.Quantity);
                var cartTotal = user.ShoppingCarts.FirstOrDefault().ShoppingCartProducts.Sum(x => x.Product.Price * x.Quantity);

                return Json(new { prodID, cartTotal, cartCount });
            }
        }

        [HttpPost]
        [Authorize]
        public ActionResult Update(int prodID, int quan)
        {
            using (db)
            {
                var user = db.Users.FirstOrDefault(x => x.UserName == HttpContext.User.Identity.Name);

                var cart = user.ShoppingCarts.FirstOrDefault();

                var prod = cart.ShoppingCartProducts.Single(x => x.ProductID == prodID);

                prod.Quantity = quan;
                db.SaveChanges();

                var cartCount = cart.ShoppingCartProducts.Sum(x => x.Quantity);
                var cartTotal = cart.ShoppingCartProducts.Sum(x => x.Product.Price * x.Quantity);
                var prodPrice = prod.Product.Price * quan;

                return Json(new { prodID, cartCount, cartTotal, prodPrice, });
            }
        }
    }
}