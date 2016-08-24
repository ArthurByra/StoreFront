using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin;
using Owin;
using StoreFront.Models;

[assembly: OwinStartupAttribute(typeof(StoreFront.Startup))]
namespace StoreFront
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
        
    }
}


