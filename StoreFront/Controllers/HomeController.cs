using StoreFront.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace StoreFront.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        [Authorize]
        public ActionResult UserProfile(ProfileViewModel model)
        {
            using (StoreFrontContext db = new StoreFrontContext())
            {
                var userInfo = db.Users.Where(u => u.UserName == HttpContext.User.Identity.Name);
                model.UserProfile = userInfo.Select(u => new ProfileViewResultsModel { UserName = u.UserName, EmailAddress = u.EmailAddress, IsAdmin = (bool)u.IsAdmin, DateCreated = u.DateCreated.ToString() }).ToList();
            }

                return View(model);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult LogOff()
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("Index", "Home");
        }

    }
}