using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Dynamic.BusinessEntity.Account;
using Dynamic.BusinessEntity.Global;

namespace PivotalERP.Areas.Setup.Controllers
{
    public class CreationController : PivotalERP.Controllers.BaseController
    {
        // GET: Setup/Creation
      
        public ActionResult District()
        {
            return View();
        }
        public ActionResult Country()
        {
            return View();
        }
        public ActionResult DueToResidenceElseWhere()
        {
            return View();
        }
        public ActionResult Profession()
        {
            return View();
        }
        public ActionResult MarriedStatus()
        {
            return View();
        }
        public ActionResult VocationalTrainingOrSkills()
        {
            return View();
        }








        #region "District"
        //[PermissionsAttribute(Dynamic.BusinessEntity.Global.Actions.View, (int)FormsEntity.IncomeSource)]

        [HttpPost]
        ////[PermissionsAttribute(Dynamic.BusinessEntity.Global.Actions.Save, (int)FormsEntity.IncomeSource)]
        public JsonNetResult SaveDistrictList()
        {

            ResponeValues resVal = new ResponeValues();
            try
            {
                var beData = DeserializeObject<ProfileLib.BE.DistrictList>(Request["jsonData"]);
                if (beData != null)
                {
                    beData.CUserId = User.UserId;

                    if (!beData.DId.HasValue)
                        beData.DId = 0;

                    resVal = new ProfileLib.BL.DistrictList(User.UserId, User.HostName, User.DBName).SaveFormData(beData);
                }
                else
                {
                    resVal.ResponseMSG = "Blank Data Can't be Accept";
                }
            }
            catch (Exception ee)
            {
                resVal.IsSuccess = false;
                resVal.ResponseMSG = ee.Message;
            }
            return new JsonNetResult() { Data = resVal, TotalCount = 0, IsSuccess = resVal.IsSuccess, ResponseMSG = resVal.ResponseMSG };
        }
        [HttpPost]
        //[PermissionsAttribute(ProfileLib.BE.Global.Actions.Modify, (int)FormsEntity.IncomeSource)]
        public JsonNetResult getDistrictListById(int DId)
        {
            ResponeValues resVal = new ResponeValues();
            try
            {
                resVal = new ProfileLib.BL.DistrictList(User.UserId, User.HostName, User.DBName).GetDistrictListById(0, DId);
            }
            catch (Exception ee)
            {
                resVal.IsSuccess = false;
                resVal.ResponseMSG = ee.Message;
            }
            return new JsonNetResult() { Data = resVal, TotalCount = 0, IsSuccess = resVal.IsSuccess, ResponseMSG = resVal.ResponseMSG };
        }

        [HttpPost]
        //[PermissionsAttribute(Dynamic.BusinessEntity.Global.Actions.Delete, (int)FormsEntity.IncomeSource)]
        public JsonNetResult DeleteDistrictList(int DId)
        {
            ResponeValues resVal = new ResponeValues();
            try
            {
                if (DId < 0)
                {
                    resVal.ResponseMSG = "Can't delete default DistrictList ";
                    resVal.IsSuccess = false;
                }
                else
                    resVal = new ProfileLib.BL.DistrictList(User.UserId, User.HostName, User.DBName).DeleteById(User.UserId, DId);
            }
            catch (Exception ee)
            {
                resVal.IsSuccess = false;
                resVal.ResponseMSG = ee.Message;
            }

            return new JsonNetResult() { Data = resVal, TotalCount = 0, IsSuccess = resVal.IsSuccess, ResponseMSG = resVal.ResponseMSG };
        }
        [HttpGet]
        public JsonNetResult GetAllDistrictList()
        {
            ProfileLib.BE.DistrictListCollections dataColl = new ProfileLib.BE.DistrictListCollections();
            try
            {
                dataColl = new ProfileLib.BL.DistrictList(User.UserId, User.HostName, User.DBName).GetAllDistrictList(0);
                return new JsonNetResult() { Data = dataColl, TotalCount = dataColl.Count, IsSuccess = dataColl.IsSuccess, ResponseMSG = dataColl.ResponseMSG };
            }
            catch (Exception ee)
            {
                dataColl.IsSuccess = false;
                dataColl.ResponseMSG = ee.Message;
            }
            return new JsonNetResult() { Data = null, TotalCount = 0, IsSuccess = dataColl.IsSuccess, ResponseMSG = dataColl.ResponseMSG };
        }

        #endregion




        #region "Country"
        //[PermissionsAttribute(Dynamic.BusinessEntity.Global.Actions.View, (int)FormsEntity.IncomeSource)]

        [HttpPost]
        ////[PermissionsAttribute(Dynamic.BusinessEntity.Global.Actions.Save, (int)FormsEntity.IncomeSource)]
        public JsonNetResult SaveCountry()
        {

            ResponeValues resVal = new ResponeValues();
            try
            {
                var beData = DeserializeObject<ProfileLib.BE.Country>(Request["jsonData"]);
                if (beData != null)
                {
                    beData.CUserId = User.UserId;

                    if (!beData.CountryId.HasValue)
                        beData.CountryId = 0;

                    resVal = new ProfileLib.BL.Country(User.UserId, User.HostName, User.DBName).SaveFormData(beData);
                }
                else
                {
                    resVal.ResponseMSG = "Blank Data Can't be Accept";
                }
            }
            catch (Exception ee)
            {
                resVal.IsSuccess = false;
                resVal.ResponseMSG = ee.Message;
            }
            return new JsonNetResult() { Data = resVal, TotalCount = 0, IsSuccess = resVal.IsSuccess, ResponseMSG = resVal.ResponseMSG };
        }
        [HttpPost]
        //[PermissionsAttribute(ProfileLib.BE.Global.Actions.Modify, (int)FormsEntity.IncomeSource)]
        public JsonNetResult getCountryById(int CountryId)
        {
            ResponeValues resVal = new ResponeValues();
            try
            {
                resVal = new ProfileLib.BL.Country(User.UserId, User.HostName, User.DBName).GetCountryById(0, CountryId);
            }
            catch (Exception ee)
            {
                resVal.IsSuccess = false;
                resVal.ResponseMSG = ee.Message;
            }
            return new JsonNetResult() { Data = resVal, TotalCount = 0, IsSuccess = resVal.IsSuccess, ResponseMSG = resVal.ResponseMSG };
        }

        [HttpPost]
        //[PermissionsAttribute(Dynamic.BusinessEntity.Global.Actions.Delete, (int)FormsEntity.IncomeSource)]
        public JsonNetResult DeleteCountry(int CountryId)
        {
            ResponeValues resVal = new ResponeValues();
            try
            {
                if (CountryId < 0)
                {
                    resVal.ResponseMSG = "Can't delete default Country ";
                    resVal.IsSuccess = false;
                }
                else
                    resVal = new ProfileLib.BL.Country(User.UserId, User.HostName, User.DBName).DeleteById(User.UserId, CountryId);
            }
            catch (Exception ee)
            {
                resVal.IsSuccess = false;
                resVal.ResponseMSG = ee.Message;
            }

            return new JsonNetResult() { Data = resVal, TotalCount = 0, IsSuccess = resVal.IsSuccess, ResponseMSG = resVal.ResponseMSG };
        }
        [HttpGet]
        public JsonNetResult GetAllCountry()
        {
            ProfileLib.BE.CountryCollections dataColl = new ProfileLib.BE.CountryCollections();
            try
            {
                dataColl = new ProfileLib.BL.Country(User.UserId, User.HostName, User.DBName).GetAllCountry(0);
                return new JsonNetResult() { Data = dataColl, TotalCount = dataColl.Count, IsSuccess = dataColl.IsSuccess, ResponseMSG = dataColl.ResponseMSG };
            }
            catch (Exception ee)
            {
                dataColl.IsSuccess = false;
                dataColl.ResponseMSG = ee.Message;
            }
            return new JsonNetResult() { Data = null, TotalCount = 0, IsSuccess = dataColl.IsSuccess, ResponseMSG = dataColl.ResponseMSG };
        }

        #endregion




        #region "DueToResidenceElseWhere"
        //[PermissionsAttribute(Dynamic.BusinessEntity.Global.Actions.View, (int)FormsEntity.IncomeSource)]

        [HttpPost]
        ////[PermissionsAttribute(Dynamic.BusinessEntity.Global.Actions.Save, (int)FormsEntity.IncomeSource)]
        public JsonNetResult SaveResidenceElseWhere()
        {

            ResponeValues resVal = new ResponeValues();
            try
            {
                var beData = DeserializeObject<ProfileLib.BE.ResidenceElseWhere>(Request["jsonData"]);
                if (beData != null)
                {
                    beData.CUserId = User.UserId;

                    if (!beData.ResidenceElseWhereId.HasValue)
                        beData.ResidenceElseWhereId = 0;

                    resVal = new ProfileLib.BL.ResidenceElseWhere(User.UserId, User.HostName, User.DBName).SaveFormData(beData);
                }
                else
                {
                    resVal.ResponseMSG = "Blank Data Can't be Accept";
                }
            }
            catch (Exception ee)
            {
                resVal.IsSuccess = false;
                resVal.ResponseMSG = ee.Message;
            }
            return new JsonNetResult() { Data = resVal, TotalCount = 0, IsSuccess = resVal.IsSuccess, ResponseMSG = resVal.ResponseMSG };
        }
        [HttpPost]
        //[PermissionsAttribute(ProfileLib.BE.Global.Actions.Modify, (int)FormsEntity.IncomeSource)]
        public JsonNetResult getResidenceElseWhereById(int ResidenceElseWhereId)
        {
            ResponeValues resVal = new ResponeValues();
            try
            {
                resVal = new ProfileLib.BL.ResidenceElseWhere(User.UserId, User.HostName, User.DBName).GetResidenceElseWhereById(0, ResidenceElseWhereId);
            }
            catch (Exception ee)
            {
                resVal.IsSuccess = false;
                resVal.ResponseMSG = ee.Message;
            }
            return new JsonNetResult() { Data = resVal, TotalCount = 0, IsSuccess = resVal.IsSuccess, ResponseMSG = resVal.ResponseMSG };
        }

        [HttpPost]
        //[PermissionsAttribute(Dynamic.BusinessEntity.Global.Actions.Delete, (int)FormsEntity.IncomeSource)]
        public JsonNetResult DeleteResidenceElseWhere(int ResidenceElseWhereId)
        {
            ResponeValues resVal = new ResponeValues();
            try
            {
                if (ResidenceElseWhereId < 0)
                {
                    resVal.ResponseMSG = "Can't delete default ResidenceElseWhere ";
                    resVal.IsSuccess = false;
                }
                else
                    resVal = new ProfileLib.BL.ResidenceElseWhere(User.UserId, User.HostName, User.DBName).DeleteById(User.UserId, ResidenceElseWhereId);
            }
            catch (Exception ee)
            {
                resVal.IsSuccess = false;
                resVal.ResponseMSG = ee.Message;
            }

            return new JsonNetResult() { Data = resVal, TotalCount = 0, IsSuccess = resVal.IsSuccess, ResponseMSG = resVal.ResponseMSG };
        }
        [HttpGet]
        public JsonNetResult GetAllResidenceElseWhere()
        {
            ProfileLib.BE.ResidenceElseWhereCollections dataColl = new ProfileLib.BE.ResidenceElseWhereCollections();
            try
            {
                dataColl = new ProfileLib.BL.ResidenceElseWhere(User.UserId, User.HostName, User.DBName).GetAllResidenceElseWhere(0);
                return new JsonNetResult() { Data = dataColl, TotalCount = dataColl.Count, IsSuccess = dataColl.IsSuccess, ResponseMSG = dataColl.ResponseMSG };
            }
            catch (Exception ee)
            {
                dataColl.IsSuccess = false;
                dataColl.ResponseMSG = ee.Message;
            }
            return new JsonNetResult() { Data = null, TotalCount = 0, IsSuccess = dataColl.IsSuccess, ResponseMSG = dataColl.ResponseMSG };
        }

        #endregion




        #region "Profession"
        //[PermissionsAttribute(Dynamic.BusinessEntity.Global.Actions.View, (int)FormsEntity.IncomeSource)]

        [HttpPost]
        ////[PermissionsAttribute(Dynamic.BusinessEntity.Global.Actions.Save, (int)FormsEntity.IncomeSource)]
        public JsonNetResult SaveProfession()
        {

            ResponeValues resVal = new ResponeValues();
            try
            {
                var beData = DeserializeObject<ProfileLib.BE.Profession>(Request["jsonData"]);
                if (beData != null)
                {
                    beData.CUserId = User.UserId;

                    if (!beData.ProfessionId.HasValue)
                        beData.ProfessionId = 0;

                    resVal = new ProfileLib.BL.Profession(User.UserId, User.HostName, User.DBName).SaveFormData(beData);
                }
                else
                {
                    resVal.ResponseMSG = "Blank Data Can't be Accept";
                }
            }
            catch (Exception ee)
            {
                resVal.IsSuccess = false;
                resVal.ResponseMSG = ee.Message;
            }
            return new JsonNetResult() { Data = resVal, TotalCount = 0, IsSuccess = resVal.IsSuccess, ResponseMSG = resVal.ResponseMSG };
        }
        [HttpPost]
        //[PermissionsAttribute(ProfileLib.BE.Global.Actions.Modify, (int)FormsEntity.IncomeSource)]
        public JsonNetResult getProfessionById(int ProfessionId)
        {
            ResponeValues resVal = new ResponeValues();
            try
            {
                resVal = new ProfileLib.BL.Profession(User.UserId, User.HostName, User.DBName).GetProfessionById(0, ProfessionId);
            }
            catch (Exception ee)
            {
                resVal.IsSuccess = false;
                resVal.ResponseMSG = ee.Message;
            }
            return new JsonNetResult() { Data = resVal, TotalCount = 0, IsSuccess = resVal.IsSuccess, ResponseMSG = resVal.ResponseMSG };
        }

        [HttpPost]
        //[PermissionsAttribute(Dynamic.BusinessEntity.Global.Actions.Delete, (int)FormsEntity.IncomeSource)]
        public JsonNetResult DeleteProfession(int ProfessionId)
        {
            ResponeValues resVal = new ResponeValues();
            try
            {
                if (ProfessionId < 0)
                {
                    resVal.ResponseMSG = "Can't delete default Profession ";
                    resVal.IsSuccess = false;
                }
                else
                    resVal = new ProfileLib.BL.Profession(User.UserId, User.HostName, User.DBName).DeleteById(User.UserId, ProfessionId);
            }
            catch (Exception ee)
            {
                resVal.IsSuccess = false;
                resVal.ResponseMSG = ee.Message;
            }

            return new JsonNetResult() { Data = resVal, TotalCount = 0, IsSuccess = resVal.IsSuccess, ResponseMSG = resVal.ResponseMSG };
        }
        [HttpGet]
        public JsonNetResult GetAllProfession()
        {
            ProfileLib.BE.ProfessionCollections dataColl = new ProfileLib.BE.ProfessionCollections();
            try
            {
                dataColl = new ProfileLib.BL.Profession(User.UserId, User.HostName, User.DBName).GetAllProfession(0);
                return new JsonNetResult() { Data = dataColl, TotalCount = dataColl.Count, IsSuccess = dataColl.IsSuccess, ResponseMSG = dataColl.ResponseMSG };
            }
            catch (Exception ee)
            {
                dataColl.IsSuccess = false;
                dataColl.ResponseMSG = ee.Message;
            }
            return new JsonNetResult() { Data = null, TotalCount = 0, IsSuccess = dataColl.IsSuccess, ResponseMSG = dataColl.ResponseMSG };
        }

        #endregion





        #region "MarriedStatus"
        //[PermissionsAttribute(Dynamic.BusinessEntity.Global.Actions.View, (int)FormsEntity.IncomeSource)]

        [HttpPost]
        ////[PermissionsAttribute(Dynamic.BusinessEntity.Global.Actions.Save, (int)FormsEntity.IncomeSource)]
        public JsonNetResult SaveMarriedStatus()
        {

            ResponeValues resVal = new ResponeValues();
            try
            {
                var beData = DeserializeObject<ProfileLib.BE.MarriedStatus>(Request["jsonData"]);
                if (beData != null)
                {
                    beData.CUserId = User.UserId;

                    if (!beData.MarriedStatusId.HasValue)
                        beData.MarriedStatusId = 0;

                    resVal = new ProfileLib.BL.MarriedStatus(User.UserId, User.HostName, User.DBName).SaveFormData(beData);
                }
                else
                {
                    resVal.ResponseMSG = "Blank Data Can't be Accept";
                }
            }
            catch (Exception ee)
            {
                resVal.IsSuccess = false;
                resVal.ResponseMSG = ee.Message;
            }
            return new JsonNetResult() { Data = resVal, TotalCount = 0, IsSuccess = resVal.IsSuccess, ResponseMSG = resVal.ResponseMSG };
        }
        [HttpPost]
        //[PermissionsAttribute(ProfileLib.BE.Global.Actions.Modify, (int)FormsEntity.IncomeSource)]
        public JsonNetResult getMarriedStatusById(int MarriedStatusId)
        {
            ResponeValues resVal = new ResponeValues();
            try
            {
                resVal = new ProfileLib.BL.MarriedStatus(User.UserId, User.HostName, User.DBName).GetMarriedStatusById(0, MarriedStatusId);
            }
            catch (Exception ee)
            {
                resVal.IsSuccess = false;
                resVal.ResponseMSG = ee.Message;
            }
            return new JsonNetResult() { Data = resVal, TotalCount = 0, IsSuccess = resVal.IsSuccess, ResponseMSG = resVal.ResponseMSG };
        }

        [HttpPost]
        //[PermissionsAttribute(Dynamic.BusinessEntity.Global.Actions.Delete, (int)FormsEntity.IncomeSource)]
        public JsonNetResult DeleteMarriedStatus(int MarriedStatusId)
        {
            ResponeValues resVal = new ResponeValues();
            try
            {
                if (MarriedStatusId < 0)
                {
                    resVal.ResponseMSG = "Can't delete default MarriedStatus ";
                    resVal.IsSuccess = false;
                }
                else
                    resVal = new ProfileLib.BL.MarriedStatus(User.UserId, User.HostName, User.DBName).DeleteById(User.UserId, MarriedStatusId);
            }
            catch (Exception ee)
            {
                resVal.IsSuccess = false;
                resVal.ResponseMSG = ee.Message;
            }

            return new JsonNetResult() { Data = resVal, TotalCount = 0, IsSuccess = resVal.IsSuccess, ResponseMSG = resVal.ResponseMSG };
        }
        [HttpGet]
        public JsonNetResult GetAllMarriedStatus()
        {
            ProfileLib.BE.MarriedStatusCollections dataColl = new ProfileLib.BE.MarriedStatusCollections();
            try
            {
                dataColl = new ProfileLib.BL.MarriedStatus(User.UserId, User.HostName, User.DBName).GetAllMarriedStatus(0);
                return new JsonNetResult() { Data = dataColl, TotalCount = dataColl.Count, IsSuccess = dataColl.IsSuccess, ResponseMSG = dataColl.ResponseMSG };
            }
            catch (Exception ee)
            {
                dataColl.IsSuccess = false;
                dataColl.ResponseMSG = ee.Message;
            }
            return new JsonNetResult() { Data = null, TotalCount = 0, IsSuccess = dataColl.IsSuccess, ResponseMSG = dataColl.ResponseMSG };
        }

        #endregion






        #region "VocationalTrainingOrSkills"
        //[PermissionsAttribute(Dynamic.BusinessEntity.Global.Actions.View, (int)FormsEntity.IncomeSource)]

        [HttpPost]
        ////[PermissionsAttribute(Dynamic.BusinessEntity.Global.Actions.Save, (int)FormsEntity.IncomeSource)]
        public JsonNetResult SaveVocationalTrainingOrSkill()
        {

            ResponeValues resVal = new ResponeValues();
            try
            {
                var beData = DeserializeObject<ProfileLib.BE.VocationalTrainingOrSkill>(Request["jsonData"]);
                if (beData != null)
                {
                    beData.CUserId = User.UserId;

                    if (!beData.VocationalId.HasValue)
                        beData.VocationalId = 0;

                    resVal = new ProfileLib.BL.VocationalTrainingOrSkill(User.UserId, User.HostName, User.DBName).SaveFormData(beData);
                }
                else
                {
                    resVal.ResponseMSG = "Blank Data Can't be Accept";
                }
            }
            catch (Exception ee)
            {
                resVal.IsSuccess = false;
                resVal.ResponseMSG = ee.Message;
            }
            return new JsonNetResult() { Data = resVal, TotalCount = 0, IsSuccess = resVal.IsSuccess, ResponseMSG = resVal.ResponseMSG };
        }
        [HttpPost]
        //[PermissionsAttribute(ProfileLib.BE.Global.Actions.Modify, (int)FormsEntity.IncomeSource)]
        public JsonNetResult getVocationalTrainingOrSkillById(int VocationalId)
        {
            ResponeValues resVal = new ResponeValues();
            try
            {
                resVal = new ProfileLib.BL.VocationalTrainingOrSkill(User.UserId, User.HostName, User.DBName).GetVocationalTrainingOrSkillById(0, VocationalId);
            }
            catch (Exception ee)
            {
                resVal.IsSuccess = false;
                resVal.ResponseMSG = ee.Message;
            }
            return new JsonNetResult() { Data = resVal, TotalCount = 0, IsSuccess = resVal.IsSuccess, ResponseMSG = resVal.ResponseMSG };
        }

        [HttpPost]
        //[PermissionsAttribute(Dynamic.BusinessEntity.Global.Actions.Delete, (int)FormsEntity.IncomeSource)]
        public JsonNetResult DeleteVocationalTrainingOrSkill(int VocationalId)
        {
            ResponeValues resVal = new ResponeValues();
            try
            {
                if (VocationalId < 0)
                {
                    resVal.ResponseMSG = "Can't delete default VocationalTrainingOrSkill ";
                    resVal.IsSuccess = false;
                }
                else
                    resVal = new ProfileLib.BL.VocationalTrainingOrSkill(User.UserId, User.HostName, User.DBName).DeleteById(User.UserId, VocationalId);
            }
            catch (Exception ee)
            {
                resVal.IsSuccess = false;
                resVal.ResponseMSG = ee.Message;
            }

            return new JsonNetResult() { Data = resVal, TotalCount = 0, IsSuccess = resVal.IsSuccess, ResponseMSG = resVal.ResponseMSG };
        }
        [HttpGet]
        public JsonNetResult GetAllVocationalTrainingOrSkill()
        {
            ProfileLib.BE.VocationalTrainingOrSkillCollections dataColl = new ProfileLib.BE.VocationalTrainingOrSkillCollections();
            try
            {
                dataColl = new ProfileLib.BL.VocationalTrainingOrSkill(User.UserId, User.HostName, User.DBName).GetAllVocationalTrainingOrSkill(0);
                return new JsonNetResult() { Data = dataColl, TotalCount = dataColl.Count, IsSuccess = dataColl.IsSuccess, ResponseMSG = dataColl.ResponseMSG };
            }
            catch (Exception ee)
            {
                dataColl.IsSuccess = false;
                dataColl.ResponseMSG = ee.Message;
            }
            return new JsonNetResult() { Data = null, TotalCount = 0, IsSuccess = dataColl.IsSuccess, ResponseMSG = dataColl.ResponseMSG };
        }

        #endregion






    }
}