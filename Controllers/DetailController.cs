using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebApplication1.Models;

namespace WebApplication1.Controllers {
  public class DetailController : Controller {
    private ProductModel products = new ProductModel();
    public ActionResult Index(int id) {
      var product = products.FindProduct(id);
      return View(product);
    }
  }
}