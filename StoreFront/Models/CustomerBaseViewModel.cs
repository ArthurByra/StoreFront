using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Data.Entity;
using System.Web;
using System.Web.Providers.Entities;
using System.Web.Profile;
using System.Web.Security;

namespace StoreFront.Models
{
    public class CustomerBaseViewModel
    {
        public string Name { get; set; }

        public string UserName(string initialName) //grabbed via Session
        {
            string finalName;
            char firstChar;
            string lastName;
            initialName = "Arthur Byra"; //will change if username has first and last name

            //http://stackoverflow.com/questions/10389805/split-string-at-first-space
            lastName = initialName.Substring(initialName.IndexOf(' ') + 1).ToLower(); //grabs last name and converts to lowercase

            firstChar = initialName.ToLower()[0]; //Grabs first character from name after converting to lowercase

            StringBuilder build = new StringBuilder(); //new instance of StringBuilder class
            finalName = build.Append(firstChar).Append(lastName).ToString();

            return finalName;
        }

        public int UserID()
        {
            using (StoreFrontContext db = new StoreFrontContext())
            {
                var findMe = db.Users.FirstOrDefault(x => x.UserName == "ArthurByra").UserID;

                return findMe;
            }
        }
    }
    
    public class LoginViewModel
    {
        public int UserID { get; set; }

        [DisplayName("Username")]
        [Required(ErrorMessage = "Username is required")]
        public string UserName { get; set; }

        [DisplayName("Password")]
        [DataType(DataType.Password)]
        [Required(ErrorMessage = "Password is required")]
        public string Password { get; set; }
    }

    public class RegisterViewModel
    {
        public int UserID { get; set; }

        [DisplayName("Username")]
        [Required(ErrorMessage = "Username is required")]
        public string UserName { get; set; }

        [DisplayName("Password")]
        [DataType(DataType.Password)]
        [Required(ErrorMessage = "Password is required")]
        public string Password { get; set; }

        [DisplayName("Confirm Password")]
        [DataType(DataType.Password)]
        [Compare("Password", ErrorMessage = "Password must match with Confirm Password")]
        public string ConfirmPassword { get; set; }

        [DisplayName("Email")]
        [Required(ErrorMessage = "Email is required")]
        [RegularExpression(@"^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$",
        ErrorMessage = "Please enter a valid email")]
        public string EmailAddress { get; set; }

        public Nullable<bool> IsAdmin { get; set; }
        public Nullable<System.DateTime> DateCreated { get; set; }
    }
}