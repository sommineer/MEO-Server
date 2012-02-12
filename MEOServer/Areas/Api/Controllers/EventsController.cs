using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MEOServer.Models;

namespace MEOServer.Areas.API.Controllers
{
    public class EventsController : Controller
    {
        MEOModelContainer entities;

        //
        // GET: /API/Events/

        public EventsController()
        {
            this.entities = new MEOModelContainer();
        }

        public ActionResult Index()
        {
            return View();
        }

        [RestHttpVerbFilter]
        public JsonResult Event(int? id, string httpVerb)
        {
            JsonResult result;

            switch (httpVerb)
            {
                //case "POST":
                //    return "POST";
                //case "PUT":
                //    return "PUT";
                case "GET":
                    result = Json(this.entities.Events.Find(id));
                    break;
                //case "DELETE":
                //    return "DELETE";
                default:
                    result = Json(new { Error = true, Message = "Unknown HTTP verb" });
                    break;
            }

            // Allow get as we are not sending sensitive data for events
            result.JsonRequestBehavior = JsonRequestBehavior.AllowGet;

            return result;
        }
    }
}
