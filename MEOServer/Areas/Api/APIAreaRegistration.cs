using System.Web.Mvc;

namespace MEOServer.Areas.API
{
    public class APIAreaRegistration : AreaRegistration
    {
        public override string AreaName
        {
            get
            {
                return "API";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context)
        {
            context.MapRoute("SingleEvent", 
                "Api/Events/Event/{id}", 
                new { controller = "Events", action = "Event", id = UrlParameter.Optional }
                );
            context.MapRoute("ListEvents", 
                "Api/Events", 
                new { controller = "Events", action = "EventList", id = UrlParameter.Optional }
                );
            context.MapRoute("SingleLocation",
                "Api/Locations/Location/{id}",
                new {controller = "Locations", action = "Location", id = UrlParameter.Optional }
                );
        }
    }
}
