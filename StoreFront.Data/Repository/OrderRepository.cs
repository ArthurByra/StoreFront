using StoreFront.Data.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using StoreFront;
using StoreFront.Data.DAL;

namespace StoreFront.Data.Repository
{
    //http://www.asp.net/mvc/overview/older-versions/getting-started-with-ef-5-using-mvc-4/implementing-the-repository-and-unit-of-work-patterns-in-an-asp-net-mvc-application
    public class OrderRepository : IOrderRepository
    {
        private StoreFrontEntities1 context;

        public OrderRepository(StoreFrontEntities1 context)
        {
            this.context = context;
        }

        public IEnumerable<Order> GetOrders()
        {
            return context.Orders;
        }

        public Order GetOrderByID(int id)
        {
            return context.Orders.Find(id);
        }

        public void Save()
        {
            context.SaveChanges();
        }

    }
}