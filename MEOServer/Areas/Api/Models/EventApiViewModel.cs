using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MEOServer.Areas.Api.Models
{
    public class EventApiViewModel
    {
        public int Id { get; set; }
        public String Name { get; set; }
        public String Description { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime? EndDate { get; set; }
        public String PhoneNum { get; set; }
        public int? IconId { get; set; }
        public int? QRId { get; set; }
        public LocationApiViewModel Location { get; set; }
        public int UserId { get; set; }
        public ICollection<CategoryViewModel> Categories { get; set; }
    }
}