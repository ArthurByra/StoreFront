using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace StoreFront.Controllers
{
    public class SearchController : Controller
    {
        public ActionResult Index()
        {
            //Will be a blank search page with a text box and a search button
            return View();
        }

        public ActionResult Search()
        {
            //Happens when the user clicks the search button
            //Takes a string parameter that will be used to search against the products in the database and display the results
            //Needs a special message when a search returns no results
            return View();
        }

        public ActionResult AddToCart()
        {
            //Happens when the user clicks the Add To Cart button on a product result line
            //Will use AJAX to add the product to the customer's cart without refreshing the page
            return View();
        }
    }
}