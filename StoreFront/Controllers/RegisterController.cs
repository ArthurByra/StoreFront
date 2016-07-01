using StoreFront.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace StoreFront.Controllers
{
    public class RegisterController : Controller
    {
        StoreFrontContext db = new StoreFrontContext();

        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Index(RegisterViewModel account)
        {
            if (ModelState.IsValid)
            {
                using (db)
                {
                    bool duplicate = db.Users.Any(a => a.UserName == account.UserName);

                    if (duplicate)
                    {
                        ModelState.AddModelError("", "Username already exists in database!");
                    }
                    else
                    {
                        db.Users.Add(new StoreFront.Models.User { UserName = account.UserName, Password = account.Password, EmailAddress = account.EmailAddress, IsAdmin = false, DateCreated = DateTime.Now });
                        db.SaveChanges();

                        ModelState.Clear();

                        TempData["Notice"] = "Successfully registered!!";
                        return View();
                    }
                }
            }
            return View();
        }
    }
}