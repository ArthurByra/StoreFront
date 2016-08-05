using StoreFront.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Profile;
using System.Web.Security;

namespace StoreFront.Controllers
{
    public class LoginController : Controller
    {
        [HttpGet]
        public ActionResult Index()
        {
            var login = new LoginViewModel();
            return View(login);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Index(LoginViewModel userLogin)
        {
            using (StoreFrontContext db = new StoreFrontContext())
            {
                if (!ModelState.IsValid)
                {
                    return View();
                }
                else
                {
                    var usr = db.Users.Where(u => u.UserName.ToLower() == userLogin.UserName.ToLower() && u.Password.Equals(userLogin.Password, StringComparison.Ordinal)).FirstOrDefault();
                    if (usr != null)
                    {
                        FormsAuthentication.SetAuthCookie(usr.UserName, false);

                        if (usr.IsAdmin == true)
                        {
                            if (!Roles.RoleExists("Admin"))
                                Roles.CreateRole("Admin");

                            var x = Roles.GetAllRoles();

                            if (!Roles.IsUserInRole(usr.UserName, "Admin"))
                                Roles.AddUserToRole(usr.UserName, "Admin");
                        }

                        return RedirectToAction("Index", "Home");
                    }
                    else
                    {
                        ModelState.AddModelError("", "Username or Password is incorrect.");
                    }
                }
            }

            return View();
        }
    }
}