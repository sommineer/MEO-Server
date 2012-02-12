using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MEOServer.Models;

namespace MEOServer.Areas.Api.Models
{
    public class LocationApiViewModel
    {
        public int Id { get; set; }
        public String Name { get; set; }
        public String StreetAddress1 { get; set; }
        public String StreetAddress2 { get; set; }
        public String City { get; set; }
        public String State { get; set; }
        public String ZipCode { get; set; }
        public String Phone { get; set; }
        public String Website { get; set; }
        public int IconId { get; set; }
        public int Latitude { get; set; }
        public int Longitude { get; set; }
    }
}