using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace StoreFront.Models
{
    public class ProfileViewModel : CustomerBaseViewModel
    {
        public List<ProfileViewResultsModel> UserProfile { get; set; }

        public ProfileViewModel()
        {
            UserProfile = new List<ProfileViewResultsModel>();
        }
    }

    public class ProfileViewResultsModel
    {
        public string UserName { get; set; }
        public string EmailAddress { get; set; }
        public bool IsAdmin { get; set; }
        public string DateCreated { get; set; }
    }

}