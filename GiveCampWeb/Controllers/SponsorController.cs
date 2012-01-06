using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using GiveCampWeb.Models;

namespace GiveCampWeb.Controllers
{
    public class SponsorController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        [Authorize]
        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        [Authorize]
        public ActionResult Create(Sponsor sponsor, string cancelButton)
        {

            return View();
        }
    }
}
