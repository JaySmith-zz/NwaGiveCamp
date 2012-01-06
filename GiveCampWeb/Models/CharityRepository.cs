using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GiveCampWeb.Models
{
    public class CharityRepository
    {
        private GiveCampDataContext _datacontext = new GiveCampDataContext();

        public IQueryable<CharityRequirement> GetAllCharities()
        {
            return _datacontext.CharityRequirements;
        }

        public CharityRequirement Get(int charityId)
        {
            return _datacontext.CharityRequirements
                    .Where(x => x.CharityRequirementId == charityId)
                    .FirstOrDefault();
        }

        public void Register(CharityRequirement charity)
        {
            Register(charity, new List<Technology>(), new List<Technology>());
        }

        public void Register(CharityRequirement charity, IList<Technology> infrastructure, IList<Technology> support)
        {
            foreach (var inf in infrastructure)
            {
                var charityInfrastructure = new CharityRequirementTechnologiesUsed
                {
                    CharityRequirement = charity,
                    CharityRequirementId = charity.CharityRequirementId,
                    TechnologyId = inf.TechnologyID
                };
            }

            foreach (var supp in support)
            {
                var charitySupport = new CharityRequirementSupportSkill
                {
                    CharityRequirement = charity,
                     TechnologyId = supp.TechnologyID,
                     CharityRequirementId = charity.CharityRequirementId
                };

            }
            _datacontext.CharityRequirements.InsertOnSubmit(charity);
        }

        public void Save()
        {
            _datacontext.SubmitChanges();
        }
    }

    public class MockCharityRepository
    {
        private List<CharityRequirement> charityList = new List<CharityRequirement>();


        public MockCharityRepository()
        {
            for (int i = 0; i < 10; i++)
            {
                var charity = new CharityRequirement();
                charity.CharityRequirementId = i;
                charity.CharityName = "Charity " + i;
                charity.BackgroundInformation = "Some background information";

                charityList.Add(charity);
            }
            
        }

        public IQueryable<CharityRequirement> GetAllCharities()
        {
            return charityList.AsQueryable();
        }

        public CharityRequirement Get(int charityId)
        {
            return charityList
                .Where(x => x.CharityRequirementId == charityId)
                .FirstOrDefault();
        }

        public void Register(CharityRequirement charity)
        {
            Register(charity, new List<Technology>(), new List<Technology>());
        }

        public void Register(CharityRequirement charity, IList<Technology> infrastructure, IList<Technology> support)
        {
            
        }

        public void Save()
        {
            
        }
    }
}
