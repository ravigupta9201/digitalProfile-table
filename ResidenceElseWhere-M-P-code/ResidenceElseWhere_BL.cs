using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dynamic.DataAccess.Global;

namespace AcademicLib.BL.
{

	public class ResidenceElseWhere  
	{ 

		DA.ResidenceElseWhereDB db = null;

		int _UserId = 0;

		public ResidenceElseWhere(int UserId, string hostName, string dbName)
		{
			this._UserId = UserId;
			db = new DA.ResidenceElseWhereDB(hostName, dbName);
		}
		public ResponeValues SaveFormData(BE.ResidenceElseWhere beData)
		{
			bool isModify = beData.ResidenceElseWhereId > 0;
			ResponeValues isValid = IsValidData(ref beData, isModify);
			if (isValid.IsSuccess)
				return db.SaveUpdate(beData, isModify);
			else
				return isValid;
		}
		public BE.ResidenceElseWhereCollections GetAllResidenceElseWhere(int EntityId)
		{
			return db.getAllResidenceElseWhere(_UserId, EntityId);
		}
		public BE.ResidenceElseWhere GetResidenceElseWhereById(int EntityId, int ResidenceElseWhereId)
		{
			return db.getResidenceElseWhereById(_UserId, EntityId, ResidenceElseWhereId);
		}
		public ResponeValues DeleteById(int EntityId, int ResidenceElseWhereId)
		{
			return db.DeleteById(_UserId, EntityId, ResidenceElseWhereId);
		}
		public ResponeValues IsValidData(ref BE.ResidenceElseWhere beData, bool IsModify)
		{
			ResponeValues resVal = new ResponeValues();
			try
			{
			if (beData == null)
			{
				resVal.ResponseMSG = GLOBALMSG.NO_DATA_FOUND;
			}
			else if (IsModify && beData.ResidenceElseWhereId == 0)
			{
				resVal.ResponseMSG = GLOBALMSG.INVALID_DATA + " For Modify";
			}
			else if (!IsModify && beData.ResidenceElseWhereId != 0)
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

