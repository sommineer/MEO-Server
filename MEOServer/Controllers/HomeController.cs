using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MEOServer.Models;

namespace MEOServer.Controllers
{
    public class HomeController : Controller
    {
        //
        // GET: /Home/

        public String Index()
        {
            /*
            MEOModelContainer entities = new MEOModelContainer();
            Location location = new Location();
            location.Name = "Test";
            location.StreetAddress1 = "Street1";
            location.City = "City";
            location.State = "WI";
            location.Latitude = 0;
            location.Longitude = 0;
            location.LastModified = DateTime.Now;
            location.LastModifiedBy = "Me";

            entities.Locations.Add(location);
            entities.SaveChanges();
            */
            return "hey";
        }

    }
}

