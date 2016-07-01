using StoreFront.Data.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StoreFront.Data
{
    public class ProductDal
    {
        Entity.StoreFrontEntities context = new Entity.StoreFrontEntities();

        public List<ProductViewModel> ProductSearch(string search)
        {
            return context.Products.Where(x => x.ProductName.Contains(search)).Select(x => new ProductViewModel { Name = x.ProductName, Price = (x.Price ?? 999999999m), ImageFile = x.ImageFile }).ToList();
        }

    }
}
