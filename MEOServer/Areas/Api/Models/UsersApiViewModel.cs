using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MEOServer.Models;

namespace MEOServer.Areas.Api.Models
{
    public class UserApiViewModel
    {
        public int Id { get; set; }
        public String Email { get; set; }
        public bool IsBusiness { get; set; }
        public String BusinessName { get; set; }
        public String FirstName { get; set; }
        public String LastName { get; set; }
    }
}