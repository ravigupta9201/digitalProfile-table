using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dynamic.DataAccess.Global;

namespace ProfileLib.BL
{

	public class VocationalTrainingOrSkill
	{

		DA.VocationalTrainingOrSkillDB db = null;

		int _UserId = 0;

		public VocationalTrainingOrSkill(int UserId, string hostName, string dbName)
		{
			this._UserId = UserId;
			db = new DA.VocationalTrainingOrSkillDB(hostName, dbName);
		}
		public ResponeValues SaveFormData(BE.VocationalTrainingOrSkill beData)
		{
			bool isModify = beData.VocationalId > 0;
			ResponeValues isValid = IsValidData(ref beData, isModify);
			if (isValid.IsSuccess)
				return db.SaveUpdate(beData, isModify);
			else
				return isValid;
		}
		public BE.VocationalTrainingOrSkillCollections GetAllVocationalTrainingOrSkill(int EntityId)
		{
			return db.getAllVocationalTrainingOrSkill(_UserId, EntityId);
		}
		public BE.VocationalTrainingOrSkill GetVocationalTrainingOrSkillById(int EntityId, int VocationalId)
		{
			return db.getVocationalTrainingOrSkillById(_UserId, EntityId, VocationalId);
		}
		public ResponeValues DeleteById(int EntityId, int VocationalId)
		{
			return db.DeleteById(_UserId, EntityId, VocationalId);
		}
		public ResponeValues IsValidData(ref BE.VocationalTrainingOrSkill beData, bool IsModify)
		{
			ResponeValues resVal = new ResponeValues();
			try
			{
				if (beData == null)
				{
					resVal.ResponseMSG = GLOBALMSG.NO_DATA_FOUND;
				}
				else if (IsModify && beData.VocationalId == 0)
				{
					resVal.ResponseMSG = GLOBALMSG.INVALID_DATA + " For Modify";
				}
				else if (!IsModify && beData.VocationalId != 0)
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

