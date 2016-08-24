using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using StoreFront.Data.Models;

namespace StoreFront.Data.Repository
{
    public interface IInventoryRepository
    {
        IEnumerable<Product> SearchProducts(string searchText);
        FullProduct GetProduct(int id);
    }
}
