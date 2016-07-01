using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using StoreFront.Models;
using System.ComponentModel.DataAnnotations;

namespace StoreFront.ViewModels
{
    public class SearchViewModel : CustomerBaseViewModel
    {
        public string SearchText { get; set; }

        public List<SearchResultsViewModel> Results { get; set; }

        public SearchViewModel()
        {
            Results = new List<SearchResultsViewModel>();
        }
    }

    public class SearchResultsViewModel
    {
        public int ProductID { get; set; }
        public string Name { get; set; }
        public decimal Price { get; set; }
        public string ImageFile { get; set; }
    }
}