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
using StoreFront.Data.DAL;

namespace StoreFront.Controllers
{
    public class OrderAdminController : Controller
    {
        private IOrderRepository orderRepository;

        private OrderAdminController()
        {
            orderRepository = new OrderRepository(new StoreFrontEntities1());
        }

        [Authorize]    
        public ActionResult Index()
        {   
            var orders = orderRepository.GetOrders().ToList();

            OrderViewModel orderModel = new OrderViewModel();

            for (int i = 0; i < orders.Count; i++)
            {
                var o = new OrderViewResultsModel
                {
                    Username = orders[i].User.UserName,
                    Total = orders[i].Total ?? 0,
                    OrderDate = orders[i].OrderDate ?? System.DateTime.Now,
                    OrderID = orders[i].OrderID,
                    Status = orders[i].Status.ToString()
                };
                orderModel.OrderResults.Add(o);
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

        public ActionResult Details()
        {


            return View();
        }
    }
}


