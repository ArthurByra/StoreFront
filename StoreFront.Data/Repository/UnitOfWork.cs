using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using StoreFront.Data.Models;

namespace StoreFront.Data.Repository
{
    public class UnitOfWork : IUnitOfWork
    {
        private readonly StoreFrontEntities1 Context;

        public UnitOfWork(StoreFrontEntities1 context)
        {
            Context = context;
        }

        public IInventoryRepository Inventory { get; private set; }
        public IOrderRepository Orders { get; private set; }

        public int Complete()
        {
            return Context.SaveChanges();
        }

        public void Dispose()
        {
            Context.Dispose();
        }
    }
}
