using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dynamic.DataAccess.Global;

namespace AcademicLib.BL.
{

	public class DistrictList  
	{ 

		DA.DistrictListDB db = null;

		int _UserId = 0;

		public DistrictList(int UserId, string hostName, string dbName)
		{
			this._UserId = UserId;
			db = new DA.DistrictListDB(hostName, dbName);
		}
		public ResponeValues SaveFormData(BE.DistrictList beData)
		{
			bool isModify = beData.DId > 0;
			ResponeValues isValid = IsValidData(ref beData, isModify);
			if (isValid.IsSuccess)
				return db.SaveUpdate(beData, isModify);
			else
				return isValid;
		}
		public BE.DistrictListCollections GetAllDistrictList(int EntityId)
		{
			return db.getAllDistrictList(_UserId, EntityId);
		}
		public BE.DistrictList GetDistrictListById(int EntityId, int DId)
		{
			return db.getDistrictListById(_UserId, EntityId, DId);
		}
		public ResponeValues DeleteById(int EntityId, int DId)
		{
			return db.DeleteById(_UserId, EntityId, DId);
		}
		public ResponeValues IsValidData(ref BE.DistrictList beData, bool IsModify)
		{
			ResponeValues resVal = new ResponeValues();
			try
			{
			if (beData == null)
			{
				resVal.ResponseMSG = GLOBALMSG.NO_DATA_FOUND;
			}
			else if (IsModify && beData.DId == 0)
			{
				resVal.ResponseMSG = GLOBALMSG.INVALID_DATA + " For Modify";
			}
			else if (!IsModify && beData.DId != 0)
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

