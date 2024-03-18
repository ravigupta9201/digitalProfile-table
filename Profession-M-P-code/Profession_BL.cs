using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dynamic.DataAccess.Global;

namespace AcademicLib.BL.
{

	public class Profession  
	{ 

		DA.ProfessionDB db = null;

		int _UserId = 0;

		public Profession(int UserId, string hostName, string dbName)
		{
			this._UserId = UserId;
			db = new DA.ProfessionDB(hostName, dbName);
		}
		public ResponeValues SaveFormData(BE.Profession beData)
		{
			bool isModify = beData.ProfessionId > 0;
			ResponeValues isValid = IsValidData(ref beData, isModify);
			if (isValid.IsSuccess)
				return db.SaveUpdate(beData, isModify);
			else
				return isValid;
		}
		public BE.ProfessionCollections GetAllProfession(int EntityId)
		{
			return db.getAllProfession(_UserId, EntityId);
		}
		public BE.Profession GetProfessionById(int EntityId, int ProfessionId)
		{
			return db.getProfessionById(_UserId, EntityId, ProfessionId);
		}
		public ResponeValues DeleteById(int EntityId, int ProfessionId)
		{
			return db.DeleteById(_UserId, EntityId, ProfessionId);
		}
		public ResponeValues IsValidData(ref BE.Profession beData, bool IsModify)
		{
			ResponeValues resVal = new ResponeValues();
			try
			{
			if (beData == null)
			{
				resVal.ResponseMSG = GLOBALMSG.NO_DATA_FOUND;
			}
			else if (IsModify && beData.ProfessionId == 0)
			{
				resVal.ResponseMSG = GLOBALMSG.INVALID_DATA + " For Modify";
			}
			else if (!IsModify && beData.ProfessionId != 0)
			{
				resVal.ResponseMSG = GLOBALMSG.INVALID_DATA + " For Save";
			}
			else if (beData.CUserId == 0)
			{
				resVal.ResponseMSG = "Invalid User for CRUD";
			}
			else
			{
				resVal.IsSuccess = true;
				resVal.ResponseMSG = "Valid";
			}
		}
		catch (Exception ee)
		{
			resVal.IsSuccess = false;
			resVal.ResponseMSG = ee.Message;
		}
			return resVal;
		}
	}

}

