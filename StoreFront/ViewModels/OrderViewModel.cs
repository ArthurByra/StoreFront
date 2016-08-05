using StoreFront.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace StoreFront.ViewModels
{
    public class OrderViewModel : CustomerBaseViewModel
    {
        public List<OrderViewResultsModel> OrderResults { get; set; } = new List<OrderViewResultsModel>();
    }

    public class OrderViewResultsModel
    {
        public int OrderID { get; set; }
        public string Username { get; set; }
        public DateTime OrderDate { get; set; }
        public decimal Total { get; set; }
        public string Status { get; set; }
    }
}