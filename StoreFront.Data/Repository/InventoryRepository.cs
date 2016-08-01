using StoreFront.Data.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StoreFront.Data.Repository
{
    class InventoryRepository
    {
        public List<Product> SearchProducts(string searchText)
        {
            using (StoreFrontEntities1 db = new StoreFrontEntities1())
            {
                var findProduct = db.Products.Where(x => x.ProductName.Contains(searchText) || x.Description.Contains(searchText)).ToList();
                
                return findProduct;
            }
        }

        public FullProduct GetProduct(int id)
        {
            using (StoreFrontEntities1 db = new StoreFrontEntities1())
            {
                FullProduct thisIsAProduct = new FullProduct();

                //o GetProduct(int id):	This should return an instance of the custom class “FullProduct”, 
                //which will have all the fields in the “Product” class in entity framework.
                //This will be populated inside the method and returned

                return thisIsAProduct;
            }
        }
        
    }
}

class FullProduct //???????????????????????????
{
    public int ProductID { get; set; }
    public string ProductName { get; set; }
    public string Description { get; set; }
    public Nullable<bool> IsPublished { get; set; }
    public Nullable<int> Quantity { get; set; }
    public Nullable<decimal> Price { get; set; }
    public string ImageFile { get; set; }
    public Nullable<System.DateTime> DateCreated { get; set; }
    public string CreatedBy { get; set; }
    public Nullable<System.DateTime> DateModified { get; set; }
    public string ModifiedBy { get; set; }
}
