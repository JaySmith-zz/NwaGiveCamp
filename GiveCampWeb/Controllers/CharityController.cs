using System.Data.Objects;
using System.Linq;
using System.Web.Mvc;
using GiveCampWeb.Models;
using System;
using System.Collections.Generic;

namespace GiveCampWeb.Controllers
{
    public class CharityController : Controller
    {
        public ActionResult Index()
        {
            return View("Landing");
        }

        public ActionResult SignUp()
        {
            return View("Landing");
            // return View("Proposal", new CharitySignUpViewModel());
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult SignUp(CharityRequirement charity, FormCollection form)
        {
            var infrastructure = SelectedTechnologies(form, "Infrastructure.");
            var support = SelectedTechnologies(form,"Support.");

            Validate(charity, infrastructure, support);

            if (ModelState.IsValid)
            {
                var charityRepository = new CharityRepository();
                charityRepository.Register(charity, infrastructure, support);
                charityRepository.Save();
                return View("ThankYou");
            }
            return View("Proposal", new CharitySignUpViewModel(charity));
        }

        public ActionResult List()
        {
            //using (ObjectContext context = new ObjectContext())
            //{
            //    //var query = context.CreateQuery<gc_CharityRequirements>().SelectMany();
            //}
            
            // var charityRepository = new MockCharityRepository();
            var charityRepository = new CharityRepository();
            
            List<CharityRequirement> charities = charityRepository.GetAllCharities().ToList();

            return View(charities);
        }

        public ActionResult Detail(int id)
        {
            // var charityRepository = new MockCharityRepository();
            var charityRepository = new CharityRepository();

            var charity = charityRepository.Get(id);

            return View(charity);
        }

        private static List<Technology> SelectedTechnologies(FormCollection form, string prefix)
        {
            var technologies = new List<Technology>();
            foreach (var key in form.Keys)
            {
                if (key.ToString().StartsWith(prefix))
                {
                    var value = form[key.ToString()];
                    bool selected = false;

                    if (value.ToLowerInvariant() == "true")
                        selected = true;
                    if (HasChanged(value) && GetNewBooleanValue(value))
                        selected = true;

                    if (selected)
                    {
                        var id = ExtractId(key.ToString());
                        var repo = new LookupRepository();
                        technologies.Add(repo.GetTechnology(id));
                    }
                }
            }
            return technologies;
        }

        private static bool HasChanged(string value)
        {
            return value.Contains(",");
        }

        private static bool GetNewBooleanValue(string value)
        {
            var values = value.Split(',');
            var newValues = values[0].ToLowerInvariant();
            return newValues == "true";
        }

        private static int ExtractId(string id)
        {
            var value = id.Split('.')[1];
            int converted;
            if (Int32.TryParse(value, out converted))
                return converted;
            
            throw new InvalidCastException("the Id wasn't an Int");
        }

        private void Validate(CharityRequirement charity, List<Technology> infrastructure, List<Technology> support)
        {
            if (String.IsNullOrEmpty(charity.CharityName))
                ModelState.AddModelError("CharityName", "Charity Name is required");

            if (!String.IsNullOrEmpty(charity.CharityName))
                if (charity.CharityName.Length > 100)
                    ModelState.AddModelError("CharityName", "Charity Name cannot exceed 100 characters");

            if (String.IsNullOrEmpty(charity.BackgroundInformation))
                ModelState.AddModelError("BackgroundInformation", "Background Information is required");

            if (!String.IsNullOrEmpty(charity.BackgroundInformation))
                if (charity.BackgroundInformation.Length > 4000)
                    ModelState.AddModelError("BackgroundInformation", "Background Information cannot exceed 4000 characters");

            if (!String.IsNullOrEmpty(charity.OtherInfrastructure))
                if (charity.OtherInfrastructure.Length > 1000)
                    ModelState.AddModelError("OtherInfrastructure", "Additional Infrastructure cannot exceed 1000 characters");

            if (!String.IsNullOrEmpty(charity.OtherSupportSkills))
                if (charity.OtherSupportSkills.Length > 1000)
                    ModelState.AddModelError("OtherSupportSkills", "Additional Support Skills cannot exceed 1000 characters");
        }
    }
}

public class CharitySignUpViewModel
{
    public CharityRequirement CharityRequirement;
    public SelectList InfrastructureTechnologies;
    public SelectList SupportSkills;

    public CharitySignUpViewModel()
    {
        Construct(null);
    }

    public CharitySignUpViewModel(CharityRequirement charity)
	{
        Construct(charity);
	}

    private void Construct(CharityRequirement charity)
    {
        if (charity == null)
            CharityRequirement = new CharityRequirement();
        else
            CharityRequirement = charity;

        var lookupRepository = new LookupRepository();

        var infrastructureTechnologies = lookupRepository.GetAllTechnologies();
        InfrastructureTechnologies = new SelectList(infrastructureTechnologies, "TechnologyID", "Description");
        SupportSkills = new SelectList(infrastructureTechnologies, "TechnologyID", "Description");
    }
}
