using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebApplication1.Models;

namespace WebApplication1.Controllers {
  public class AccountController : Controller {
    List<User> users = new List<User>() { new User() { Username = "vuthang@gmail.com", Password = "123456" }, new User() { Username = "hoangphuc@gmail.com", Password = "456" }, new User() { Username = "huuphuc@gmail.com", Password = "789" } };
    public ActionResult Index() {
      return View();
    }
    [HttpPost]
    public ActionResult CheckLogin(User user) {
      var u = users.FirstOrDefault(us => us.Username == user.Username);
      if (u == null) return Json(new { status = "fail", message = "The Username is not exist !!!" }) ;
      if(u.Password == user.Password) {
        Session["user"] = user;
        return Json(new { status = "success", message = "Successfully login" });
      }
      return Json(new { status = "fail", message = "Your Password is incorrect !!!" });
    }
    public void Logout() {
      Session["user"] = null;
    }
  }
}