using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MEOServer.Controllers
{
    public class EventController : Controller
    {
        //
        // GET: /Event/

        public String Index()
        {
            return "Hello from EventController.Index()";
        }

        public String List()
        {
            return "Hello from EventController.Browse();";
        }


        public String Details(int id)
        {
            return "Hello from EventController.Details()" + id;
        }

    }
}
