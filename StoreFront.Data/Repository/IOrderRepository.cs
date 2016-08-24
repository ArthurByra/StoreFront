using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using StoreFront.Data.Models;

namespace StoreFront.Data.Repository
{
    public interface IOrderRepository
    {
        Order GetOrder(int id);
        IEnumerable<Order> GetAllOrders();
    }
}
