//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Collections.Generic;

namespace MEOServer.Models
{
    public partial class Location
    {
        public Location()
        {
            this.Events = new HashSet<Event>();
        }
    
        public int Id { get; set; }
        public string Name { get; set; }
        public string StreetAddress1 { get; set; }
        public string StreetAddress2 { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string ZipCode { get; set; }
        public string Phone { get; set; }
        public string Website { get; set; }
        public Nullable<int> IconId { get; set; }
        public double Latitude { get; set; }
        public double Longitude { get; set; }
        public System.DateTime LastModified { get; set; }
        public string LastModifiedBy { get; set; }
    
        public virtual ICollection<Event> Events { get; set; }
    }
    
}