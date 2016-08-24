using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StoreFront.Data.Repository
{
    public interface IUnitOfWork : IDisposable
    {
        IInventoryRepository Inventory { get; }
        IOrderRepository Orders { get; }
        int Complete();
    }
}
