using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using StoreFront.Data.Models;

namespace StoreFront.Data.Repository
{
    public class OrderRepository : IOrderRepository
    {
        protected readonly StoreFrontEntities1 Context;

        public OrderRepository(StoreFrontEntities1 context)
        {
            Context = context;
        }

        public Order GetOrder(int id)
        {
            return Context.Orders.FirstOrDefault(x => x.OrderID == id);
        }

        public IEnumerable<Order> GetAllOrders()
        {
            return Context.Orders.Select(x => x);
        }
        
    }
}
