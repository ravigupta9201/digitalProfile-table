using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dynamic.DataAccess.Global;

namespace ProfileLib.BL
{

	public class Country
	{

		DA.CountryDB db = null;

		int _UserId = 0;

		public Country(int UserId, string hostName, string dbName)
		{
			this._UserId = UserId;
			db = new DA.CountryDB(hostName, dbName);
		}
		public ResponeValues SaveFormData(BE.Country beData)
		{
			bool isModify = beData.CountryId > 0;
			ResponeValues isValid = IsValidData(ref beData, isModify);
			if (isValid.IsSuccess)
				return db.SaveUpdate(beData, isModify);
			else
				return isValid;
		}
		public BE.CountryCollections GetAllCountry(int EntityId)
		{
			return db.getAllCountry(_UserId, EntityId);
		}
		public BE.Country GetCountryById(int EntityId, int CountryId)
		{
			return db.getCountryById(_UserId, EntityId, CountryId);
		}
		public ResponeValues DeleteById(int EntityId, int CountryId)
		{
			return db.DeleteById(_UserId, EntityId, CountryId);
		}
		public ResponeValues IsValidData(ref BE.Country beData, bool IsModify)
		{
			ResponeValues resVal = new ResponeValues();
			try
			{
				if (beData == null)
				{
					resVal.ResponseMSG = GLOBALMSG.NO_DATA_FOUND;
				}
				else if (IsModify && beData.CountryId == 0)
				{
					resVal.ResponseMSG = GLOBALMSG.INVALID_DATA + " For Modify";
				}
				else if (!IsModify && beData.CountryId != 0)
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

