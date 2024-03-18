using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dynamic.DataAccess.Global;

namespace AcademicLib.DA.
{

	internal class VocationalTrainingOrSkillDB
	{ 

	public ResponeValues SaveUpdate(BE.VocationalTrainingOrSkill beData , bool isModify)
{
	ResponeValues resVal = new ResponeValues();
	dal.OpenConnection();
	System.Data.SqlClient.SqlCommand cmd = dal.GetCommand();
	cmd.CommandType = System.Data.CommandType.StoredProcedure;
	cmd.Parameters.AddWithValue("@OrderNo",beData.OrderNo);
	cmd.Parameters.AddWithValue("@Code",beData.Code);
	cmd.Parameters.AddWithValue("@TrainingSubjectName",beData.TrainingSubjectName);
	cmd.Parameters.AddWithValue("@TrainingAreasName",beData.TrainingAreasName);
	cmd.Parameters.AddWithValue("@Status",beData.Status);
	
	cmd.Parameters.AddWithValue("@UserId",beData.CUserId);
	cmd.Parameters.AddWithValue("@EntityId",beData.EntityId);
	cmd.Parameters.AddWithValue("@VocationalId",beData.VocationalId);
	
	if (isModify)
	{
		cmd.CommandText = "usp_UpdateVocationalTrainingOrSkill";
	}
	else
	{
		cmd.Parameters[7].Direction = System.Data.ParameterDirection.Output;
		cmd.CommandText = "usp_AddVocationalTrainingOrSkill";
	}
	cmd.Parameters.Add("@ResponseMSG", System.Data.SqlDbType.NVarChar, 254);
	cmd.Parameters.Add("@IsSuccess", System.Data.SqlDbType.Bit);
	cmd.Parameters.Add("@ErrorNumber", System.Data.SqlDbType.Int);
	cmd.Parameters[8].Direction = System.Data.ParameterDirection.Output;
	cmd.Parameters[9].Direction = System.Data.ParameterDirection.Output;
	cmd.Parameters[10].Direction = System.Data.ParameterDirection.Output;
	try
	{
		cmd.ExecuteNonQuery();
		if (!(cmd.Parameters[7].Value is DBNull))
			resVal.RId = Convert.ToInt32(cmd.Parameters[7].Value);

		if (!(cmd.Parameters[8].Value is DBNull))
			resVal.ResponseMSG = Convert.ToString(cmd.Parameters[8].Value);

		if (!(cmd.Parameters[9].Value is DBNull))
			resVal.IsSuccess = Convert.ToBoolean(cmd.Parameters[9].Value);

		if (!(cmd.Parameters[10].Value is DBNull))
			resVal.ErrorNumber = Convert.ToInt32(cmd.Parameters[10].Value);

		if (!resVal.IsSuccess && resVal.ErrorNumber > 0)
			resVal.ResponseMSG = resVal.ResponseMSG + "(" + resVal.ErrorNumber.ToString() + ")";

	}
	catch (System.Data.SqlClient.SqlException ee)
	{
		resVal.IsSuccess = false;
		resVal.ResponseMSG = ee.Message;
	}
	catch (Exception ee)
	{
		resVal.IsSuccess = false;
		resVal.ResponseMSG = ee.Message;
	}
	finally
	{
		dal.CloseConnection();
	}

	return resVal;

}

	public ResponeValues DeleteById(int UserId, int EntityId, int VocationalId)
{
	ResponeValues resVal = new ResponeValues();
	dal.OpenConnection();
	System.Data.SqlClient.SqlCommand cmd = dal.GetCommand();
	cmd.CommandType = System.Data.CommandType.StoredProcedure;
	cmd.Parameters.AddWithValue("@UserId", UserId);
	cmd.Parameters.AddWithValue("@EntityId", EntityId);
	cmd.Parameters.AddWithValue("@VocationalId", VocationalId);
	cmd.CommandText = "usp_DelVocationalTrainingOrSkillById";
	cmd.Parameters.Add("@ResponseMSG", System.Data.SqlDbType.NVarChar, 254);
	cmd.Parameters.Add("@IsSuccess", System.Data.SqlDbType.Bit);
	cmd.Parameters.Add("@ErrorNumber", System.Data.SqlDbType.Int);
	cmd.Parameters[3].Direction = System.Data.ParameterDirection.Output;
	cmd.Parameters[4].Direction = System.Data.ParameterDirection.Output;
	cmd.Parameters[5].Direction = System.Data.ParameterDirection.Output;
	try
	{
		cmd.ExecuteNonQuery();

		if (!(cmd.Parameters[3].Value is DBNull))
			resVal.ResponseMSG = Convert.ToString(cmd.Parameters[3].Value);

		if (!(cmd.Parameters[4].Value is DBNull))
			resVal.IsSuccess = Convert.ToBoolean(cmd.Parameters[4].Value);

		if (!(cmd.Parameters[5].Value is DBNull))
			resVal.ErrorNumber = Convert.ToInt32(cmd.Parameters[5].Value);

		if (!resVal.IsSuccess && resVal.ErrorNumber > 0)
			resVal.ResponseMSG = resVal.ResponseMSG + "(" + resVal.ErrorNumber.ToString() + ")";

	}
	catch (System.Data.SqlClient.SqlException ee)
	{
		resVal.IsSuccess = false;
		resVal.ResponseMSG = ee.Message;
	}
	catch (Exception ee)
	{
		resVal.IsSuccess = false;
		resVal.ResponseMSG = ee.Message;
	}
	finally
	{
		dal.CloseConnection();
	}
	return resVal;
}
	public BE.VocationalTrainingOrSkillCollections getAllVocationalTrainingOrSkill(int UserId, int EntityId)
{
	BE.VocationalTrainingOrSkillCollections dataColl = new BE.VocationalTrainingOrSkillCollections();
	dal.OpenConnection();
	System.Data.SqlClient.SqlCommand cmd = dal.GetCommand();
	cmd.CommandType = System.Data.CommandType.StoredProcedure;
	cmd.Parameters.AddWithValue("@UserId", UserId);
	cmd.Parameters.AddWithValue("@EntityId", EntityId);
	cmd.CommandText = "usp_GetAllVocationalTrainingOrSkill";
	try
	{
		System.Data.SqlClient.SqlDataReader reader = cmd.ExecuteReader();
		while (reader.Read())
		{
			BE.VocationalTrainingOrSkill beData = new BE.VocationalTrainingOrSkill();
			if (!(reader[0] is DBNull)) beData.VocationalId = reader.GetInt32(0);
			if (!(reader[1] is DBNull)) beData.OrderNo = reader.GetInt32(1);
			if (!(reader[2] is DBNull)) beData.Code = reader.GetString(2);
			if (!(reader[3] is DBNull)) beData.TrainingSubjectName = reader.GetString(3);
			if (!(reader[4] is DBNull)) beData.TrainingAreasName = reader.GetString(4);
			if (!(reader[5] is DBNull)) beData.Status = Convert.ToBoolean(reader[5]);
			dataColl.Add(beData);
		}
		reader.Close();
		dataColl.IsSuccess = true;
		dataColl.ResponseMSG = GLOBALMSG.SUCCESS;
	}
	catch (Exception ee)
	{
		dataColl.IsSuccess = false;
		dataColl.ResponseMSG = ee.Message;
	}
	finally
	{
		dal.CloseConnection();
	}

	return dataColl;

}
	public BE.VocationalTrainingOrSkill getVocationalTrainingOrSkillById(int UserId, int EntityId, int VocationalId)
{
	BE.VocationalTrainingOrSkill beData = new BE.VocationalTrainingOrSkill();
	dal.OpenConnection();
	System.Data.SqlClient.SqlCommand cmd = dal.GetCommand();
	cmd.CommandType = System.Data.CommandType.StoredProcedure;
	cmd.Parameters.AddWithValue("@VocationalId", VocationalId);
	cmd.Parameters.AddWithValue("@UserId", UserId);
	cmd.Parameters.AddWithValue("@EntityId", EntityId);
	cmd.CommandText = "usp_GetVocationalTrainingOrSkillById";
	try
	{
		System.Data.SqlClient.SqlDataReader reader = cmd.ExecuteReader();
		if (reader.Read())
		{
			beData = new BE.VocationalTrainingOrSkill();
			if (!(reader[0] is DBNull)) beData.VocationalId = reader.GetInt32(0);
			if (!(reader[1] is DBNull)) beData.OrderNo = reader.GetInt32(1);
			if (!(reader[2] is DBNull)) beData.Code = reader.GetString(2);
			if (!(reader[3] is DBNull)) beData.TrainingSubjectName = reader.GetString(3);
			if (!(reader[4] is DBNull)) beData.TrainingAreasName = reader.GetString(4);
			if (!(reader[5] is DBNull)) beData.Status = Convert.ToBoolean(reader[5]);
			}
		reader.Close();
		beData.IsSuccess = true;
		beData.ResponseMSG = GLOBALMSG.SUCCESS;
	}
	catch (Exception ee)
	{
		beData.IsSuccess = false;
		beData.ResponseMSG = ee.Message;
	}
	finally
	{
		dal.CloseConnection();
	}

	return beData;

}

}

}

