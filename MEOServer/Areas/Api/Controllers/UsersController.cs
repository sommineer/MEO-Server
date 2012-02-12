using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MEOServer.Areas.Api.Controllers
{
    public class UsersController : Controller
    {
        //
        // GET: /Api/Users/

        public ActionResult Index()
        {
            return View();
        }

    }
}
