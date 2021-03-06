﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Net;
using System.Web;
using System.Web.Mvc;
using StoreFront.Models;
using StoreFront.ViewModels;

namespace StoreFront.Controllers
{
    public class SearchController : Controller
    {
        private StoreFrontContext db = new StoreFrontContext();

        [Authorize]
        public ActionResult Index()
        {
            var model = new SearchViewModel();
            model.Name = HttpContext.User.Identity.Name;
            return View(model);
        }

        [Authorize]
        [HttpPost]
        public ActionResult Search(SearchViewModel model)
        {
            using (db)
            {
                var products = db.Products.Where(prdt => prdt.ProductName.Contains(model.SearchText) && prdt.IsPublished == true);
                model.Results = products.Select(x => new SearchResultsViewModel { Name = x.ProductName, Price = x.Price ?? 999999, ImageFile = x.ImageFile, ProductID = x.ProductID}).ToList();
            }

            return View(model);
        }
    }
}