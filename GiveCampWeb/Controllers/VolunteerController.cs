using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using GiveCampWeb.Models;

namespace GiveCampWeb.Controllers
{
    public class VolunteerController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult SignUp()
        {
            return View("SignUp", new SignUpViewModel());
        }

        public ActionResult List()
        {
            var repository = new VolunteerRepository();
            var volunteers = repository.GetAllVolunteers().ToList();

            return View(volunteers);
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult SignUp(Volunteer volunteer, FormCollection form)
        {
            var jobRoles = SelectedJobRoles(form);
            var technologies = SelectedTechnologies(form);

            Validate(volunteer, jobRoles, technologies);

            if (ModelState.IsValid)
            {
                var volunteerRepository = new VolunteerRepository();

                volunteerRepository.Register(volunteer, jobRoles, technologies);
                volunteerRepository.Save();
                return View("Confirm");
            }


            return View(new SignUpViewModel(volunteer));
        }

        private static List<JobRole> SelectedJobRoles(FormCollection form)
        {
            var jobRoles = new List<JobRole>();
            foreach (var key in form.Keys)
            {
                if (key.ToString().StartsWith("JobType."))
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
                        jobRoles.Add(repo.GetJobRole(id));
                    }
                }
            }
            return jobRoles;
        }

        private static List<Technology> SelectedTechnologies(FormCollection form)
        {
            var technologies = new List<Technology>();
            foreach (var key in form.Keys)
            {
                if (key.ToString().StartsWith("Technology."))
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

        private static int ExtractId(string Id)
        {
            var values = Id.Split('.');
            var id = values[1];
            int converted;
            if (Int32.TryParse(id, out converted))
                return converted;
            else
                throw new InvalidCastException("the Id wasn't an Int");
        }

        private void Validate(Volunteer volunteer, List<JobRole> jobRoles, List<Technology> technologies)
        {
            if (String.IsNullOrEmpty(volunteer.FirstName))
                ModelState.AddModelError("FirstName", "First Name is Required");

            if (volunteer.FirstName != null)
                if (volunteer.FirstName.Length > 30)
                    ModelState.AddModelError("FirstName", "First name cannot exceed 30 characters");

            if (String.IsNullOrEmpty(volunteer.LastName))
                ModelState.AddModelError("LastName", "Last Name is Required");

            if (volunteer.LastName != null)
                if (volunteer.LastName.Length > 30)
                    ModelState.AddModelError("LastName", "Last name cannot exceed 30 characters");

            if (String.IsNullOrEmpty(volunteer.EmailAddress))
                ModelState.AddModelError("EmailAddress", "Email Address is Required");

            if (volunteer.TeamName != null)
                if (volunteer.TeamName.Length > 30)
                    ModelState.AddModelError("TeamName", "Team Name cannot exceed 30 characters");

            if (volunteer.EmailAddress != null)
                if (volunteer.EmailAddress.Length > 255)
                    ModelState.AddModelError("EmailAddress", "Email Address cannot exceed 250 characters");

            if (String.IsNullOrEmpty(volunteer.PhoneNumber))
                ModelState.AddModelError("PhoneNumber", "Phone Number is Required");

            if (volunteer.PhoneNumber != null)
                if (volunteer.PhoneNumber.Length > 50)
                    ModelState.AddModelError("PhoneNumber", "Phone Number cannot exceed 50 characters");

            if (jobRoles.Count == 0)
                ModelState.AddModelError("Roles", "You have to enter at least one role");

            if (String.IsNullOrEmpty(volunteer.JobDescription))
                ModelState.AddModelError("JobDescription", "Day job is Required");

            if (volunteer.JobDescription != null)
                if (volunteer.JobDescription.Length > 100)
                    ModelState.AddModelError("JobDescription", "Day job cannot exceed 100 characters");

            if (technologies.Count == 0)
                ModelState.AddModelError("Technologies", "You have to enter at least one technology");

            if (volunteer.YearsOfExperience == null)
                ModelState.AddModelError("YearsOfExperience", "Years of Experience is required");
            
            if (volunteer.DietaryNeeds != null)
                if (volunteer.DietaryNeeds.Length > 50)
                    ModelState.AddModelError("DietaryNeeds", "Dietary needs cannot exceed 50 characters");
            
            if (volunteer.TwitterHandle != null)
                if (volunteer.TwitterHandle.Length > 50)
                    ModelState.AddModelError("TwitterHandle", "Twitter handle cannot exceed 50 characters");

            if (volunteer.Bio != null)
                if (volunteer.Bio.Length > 4000)
                    ModelState.AddModelError("Bio", "Bio cannot exceed 4000 characters");

            if (volunteer.Comments != null)
                if (volunteer.Comments.Length > 4000)
                    ModelState.AddModelError("Comments", "Comments cannot exceed 4000 characters");
        }
    }

    public class SignUpViewModel
    {
        public Volunteer Volunteer;
        public SelectList Experience;
        public SelectList Technologies;
        public SelectList JobRoles { get; set; }

        public SignUpViewModel()
        {
            Construct(null);
        }

        public SignUpViewModel(Volunteer volunteer)
        {
            Construct(volunteer);
        }

        private void Construct(Volunteer volunteer)
        {
            if (volunteer == null)
                Volunteer = new Volunteer();
            else
                Volunteer = volunteer;

            var lookupRepository = new LookupRepository();

            IQueryable<JobRole> roles = lookupRepository.GetAllJobRoles();
            JobRoles = new SelectList(roles, "JobRoleID", "Description");

            var levels = lookupRepository.GetAllExperienceLevels();
            Experience = new SelectList(levels, "ExperienceLevelID", "Description");

            var technologies = lookupRepository.GetAllTechnologies();
            Technologies = new SelectList(technologies, "TechnologyID", "Description");
        }

    }

}
