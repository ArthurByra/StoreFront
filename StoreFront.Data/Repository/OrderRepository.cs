using StoreFront.Data.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StoreFront.Data.Repository
{
    class OrderRepository
    {
        public Order GetOrder(int id)
        {
            using (StoreFrontEntities1 db = new StoreFrontEntities1())
            {
                var findOrder = db.Orders.FirstOrDefault(x => x.OrderID == id);

                return findOrder;
            }
        }
    }
}