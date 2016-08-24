using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using StoreFront.Data.Models;

namespace StoreFront.Data.Repository
{
    public class InventoryRepository : IInventoryRepository
    {
        protected readonly StoreFrontEntities1 Context;

        public InventoryRepository(StoreFrontEntities1 context)
        {
            Context = context;
        }

        public IEnumerable<Product> SearchProducts(string searchText)
        {
            return Context.Products.Where(x => x.ProductName.Contains(searchText) || x.Description.Contains(searchText) && x.IsPublished == true);
        }

        public FullProduct GetProduct(int id)
        {
            var findingAProduct = Context.Products.FirstOrDefault(x => x.ProductID == id);

            FullProduct thisIsAFullProduct = new FullProduct{
                ProductID = findingAProduct.ProductID,
                ProductName = findingAProduct.ProductName,
                Description = findingAProduct.Description,
                IsPublished = findingAProduct.IsPublished,
                Quantity = findingAProduct.Quantity,
                Price = findingAProduct.Price,
                ImageFile = findingAProduct.ImageFile,
                DateCreated = findingAProduct.DateCreated,
                CreatedBy = findingAProduct.CreatedBy,
                DateModified = findingAProduct.DateModified,
                ModifiedBy = findingAProduct.ModifiedBy
                };

            return thisIsAFullProduct;
        }
    }
}