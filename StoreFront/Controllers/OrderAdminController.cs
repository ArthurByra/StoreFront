using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using StoreFront.Models;
using StoreFront.ViewModels;
using StoreFront.Data;
using StoreFront.Data.Models;
using StoreFront.Data.Repository;

namespace StoreFront.Controllers
{
    public class OrderAdminController : Controller
    {
        UnitOfWork uow = new UnitOfWork(new StoreFrontEntities1());

        [Authorize]    
        public ActionResult Index()
        {
            var orders = uow.Orders.GetAllOrders(); //need to fix the error thrown if its null...either here or repo

            OrderViewModel orderModel = new OrderViewModel();
            if (orders != null)
            {
                foreach (var item in orders)
                {
                    var results = new OrderViewResultsModel //test
                    {
                        OrderID = item.OrderID,
                        Username = item.User.UserName,
                        OrderDate = (DateTime)item.OrderDate,
                        Total = item.Total ?? 99999,
                        Status = item.Status.ToString()
                    };

                    orderModel.OrderResults.Add(results);
                }
            }
            
            return View(orderModel); //test@@@@@@@@@@@@@@@@@@@@@@@@@@@
        }

        //This page provides a listing of all the orders in the application.This will be a grid, 
        //which displays 50 rows to a page.  The grid will display the following columns:
        //•	OrderID
        //•	Username
        //•	OrderDate
        //•	Total
        //•	Status
        //The grid will also provide an edit link which will allow users to open a details page 
        //displaying all details about an order.  

        [HttpPost]
        [Authorize]
        public ActionResult Details(int id)
        {

            return View();
        }
    }
}


