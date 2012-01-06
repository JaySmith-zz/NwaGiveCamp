using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GiveCampWeb.Models
{
    public class Sponsor
    {
        public int Id { get; set; }
        public bool IsActive { get; set; }
        public string LogoUrl { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string Url { get; set; }
        public string ContactName { get; set; }
        public string ContactEmail { get; set; }
        public string ContactPhone { get; set; }
    }
}