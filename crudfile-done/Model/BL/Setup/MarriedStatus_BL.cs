using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dynamic.DataAccess.Global;

namespace ProfileLib.BL
{

	public class MarriedStatus
	{

		DA.MarriedStatusDB db = null;

		int _UserId = 0;

		public MarriedStatus(int UserId, string hostName, string dbName)
		{
			this._UserId = UserId;
			db = new DA.MarriedStatusDB(hostName, dbName);
		}
		public ResponeValues SaveFormData(BE.MarriedStatus beData)
		{
			bool isModify = beData.MarriedStatusId > 0;
			ResponeValues isValid = IsValidData(ref beData, isModify);
			if (isValid.IsSuccess)
				return db.SaveUpdate(beData, isModify);
			else
				return isValid;
		}
		public BE.MarriedStatusCollections GetAllMarriedStatus(int EntityId)
		{
			return db.getAllMarriedStatus(_UserId, EntityId);
		}
		public BE.MarriedStatus GetMarriedStatusById(int EntityId, int MarriedStatusId)
		{
			return db.getMarriedStatusById(_UserId, EntityId, MarriedStatusId);
		}
		public ResponeValues DeleteById(int EntityId, int MarriedStatusId)
		{
			return db.DeleteById(_UserId, EntityId, MarriedStatusId);
		}
		public ResponeValues IsValidData(ref BE.MarriedStatus beData, bool IsModify)
		{
			ResponeValues resVal = new ResponeValues();
			try
			{
				if (beData == null)
				{
					resVal.ResponseMSG = GLOBALMSG.NO_DATA_FOUND;
				}
				else if (IsModify && beData.MarriedStatusId == 0)
				{
					resVal.ResponseMSG = GLOBALMSG.INVALID_DATA + " For Modify";
				}
				else if (!IsModify && beData.MarriedStatusId != 0)
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

