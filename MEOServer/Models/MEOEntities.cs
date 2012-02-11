using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;

namespace MEOServer.Models
{
    public class MEOEntities : DbContext
    {
        public DbSet<Event> Events { get; set; }
        public DbSet<Location> Locations { get; set; }
    }
}