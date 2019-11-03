using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebApplication1.Models;

namespace WebApplication1.Controllers {
  public class StoreController : Controller {
    private ProductModel products = new ProductModel();
    private int PageSize = 6;
    private int CurrentPage = 1;
    private IEnumerable<Product> GetProduct(int currentPage, string sortBy) {
      ViewBag.NumberOfPages = (int)Math.Ceiling((double)products.GetProducts().Count / PageSize);
      int start = (currentPage - 1) * PageSize;
      var data = products.GetProducts();
      if(sortBy != null) {
        var sort = sortBy.Split(',');
        if (sort[0] == "Name")
          return sort[1].Equals(" A to Z") ? data.OrderBy(d => d.Name).Skip(start).Take(PageSize) : data.OrderByDescending(d => d.Name).Skip(start).Take(PageSize);
        if(sort[0] == "Price")
          return sort[1].Equals("Price, low to high") ? data.OrderBy(d => d.Price).Skip(start).Take(PageSize) : data.OrderByDescending(d => d.Price).Skip(start).Take(PageSize);
      }
      return data.Skip(start).Take(PageSize);
    }
    public ActionResult Index() {
      var result = GetProduct(CurrentPage, null);
      return View(result);
    }
    [HttpPost]
    public ActionResult ChangePage(int targetPage, string sortBy = null) {
      var result = GetProduct(targetPage, sortBy);
      return Json(result);
    }

  }
}