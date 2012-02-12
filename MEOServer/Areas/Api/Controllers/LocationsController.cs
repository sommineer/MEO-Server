using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MEOServer.Models;
using MEOServer.Areas.Api.Models;
using AutoMapper;
using Newtonsoft.Json;

namespace MEOServer.Areas.Api.Controllers
{
    public class LocationsController : Controller
    {

        MEOModelContainer entities;

        public LocationsController()
        {
            this.entities = new MEOModelContainer();
        }
        //
        // GET: /Api/Locations/

        public ActionResult Index()
        {
            return View();
        }

        [RestHttpVerbFilter]
        public JsonResult Location(int? id, LocationApiViewModel jsonLocation, string httpVerb)
        {
            JsonResult result;

            Mapper.CreateMap<Location, LocationApiViewModel>();
            Mapper.CreateMap<LocationApiViewModel, Location>();

            switch (httpVerb)
            {
                case "POST":
                    result = AddLocation(jsonLocation);
                    break;
                case "PUT":
                    result = UpdateLocation((int)id, jsonLocation);
                    break;
                case "GET":
                    result = GetLocation((int)id);
                    result.JsonRequestBehavior = JsonRequestBehavior.AllowGet;
                    break;              
                default:
                    result = Json(new { Error = true, Message = "Unknown HTTP verb" });
                    break;
            }

            /*
            // Allow get as we are not sending sensitive data for events
            result.JsonRequestBehavior = JsonRequestBehavior.AllowGet;
             * */

            return result;
        }

        private JsonResult AddLocation(LocationApiViewModel jsonLocation)
        {

            Location location = Mapper.Map<LocationApiViewModel, Location>(jsonLocation);
            location.LastModifiedBy = "admin";        // TODO: Fix this
            location.LastModified = DateTime.Now;
            entities.Locations.Add(location);
            entities.SaveChanges();

            LocationApiViewModel viewLocation = Mapper.Map<Location, LocationApiViewModel>(location);
            JsonResult result = Json(viewLocation);

            return result;
        }

        private JsonResult GetLocation(int jsonLocationId)
        {

            Location location = entities.Locations.Find(jsonLocationId);

            JsonResult result;

            if (location != null)
            {
                LocationApiViewModel viewLocation = Mapper.Map<Location, LocationApiViewModel>(location);
                result = Json(viewLocation);
            }
            else
            {
                result = Json(new { Error = true, Message = "No such location in the database" });
            }

            return result;
        }

        private JsonResult UpdateLocation(int jsonLocationId, LocationApiViewModel jsonLocation)
        {

            Location dbLocation = entities.Locations.Find(jsonLocationId);

            JsonResult result;

            if (dbLocation != null)
            {

                dbLocation = Mapper.Map<LocationApiViewModel, Location>(jsonLocation, dbLocation);
                dbLocation.LastModifiedBy = "admin";        // TODO: Fix this
                dbLocation.LastModified = DateTime.Now;

                entities.SaveChanges();
                LocationApiViewModel viewLocation = Mapper.Map<Location, LocationApiViewModel>(dbLocation);
                result = Json(viewLocation);
            }
            else
            {
                result = Json(new { Error = true, Message = "No such location in the database" });
            }

            return result;
        }
    }
}

