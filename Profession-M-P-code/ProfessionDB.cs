using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dynamic.DataAccess.Global;

namespace AcademicLib.DA.
{

	internal class ProfessionDB
	{ 

	public ResponeValues SaveUpdate(BE.Profession beData , bool isModify)
{
	ResponeValues resVal = new ResponeValues();
	dal.OpenConnection();
	System.Data.SqlClient.SqlCommand cmd = dal.GetCommand();
	cmd.CommandType = System.Data.CommandType.StoredProcedure;
	cmd.Parameters.AddWithValue("@OrderNo",beData.OrderNo);
	cmd.Parameters.AddWithValue("@Code",beData.Code);
	cmd.Parameters.AddWithValue("@ProfessionName",beData.ProfessionName);
	cmd.Parameters.AddWithValue("@className",beData.className);
	cmd.Parameters.AddWithValue("@Status",beData.Status);
	
	cmd.Parameters.AddWithValue("@UserId",beData.CUserId);
	cmd.Parameters.AddWithValue("@EntityId",beData.EntityId);
	cmd.Parameters.AddWithValue("@ProfessionId",beData.ProfessionId);
	
	if (isModify)
	{
		cmd.CommandText = "usp_UpdateProfession";
	}
	else
	{
		cmd.Parameters[7].Direction = System.Data.ParameterDirection.Output;
		cmd.CommandText = "usp_AddProfession";
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

	public ResponeValues DeleteById(int UserId, int EntityId, int ProfessionId)
{
	ResponeValues resVal = new ResponeValues();
	dal.OpenConnection();
	System.Data.SqlClient.SqlCommand cmd = dal.GetCommand();
	cmd.CommandType = System.Data.CommandType.StoredProcedure;
	cmd.Parameters.AddWithValue("@UserId", UserId);
	cmd.Parameters.AddWithValue("@EntityId", EntityId);
	cmd.Parameters.AddWithValue("@ProfessionId", ProfessionId);
	cmd.CommandText = "usp_DelProfessionById";
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
	public BE.ProfessionCollections getAllProfession(int UserId, int EntityId)
{
	BE.ProfessionCollections dataColl = new BE.ProfessionCollections();
	dal.OpenConnection();
	System.Data.SqlClient.SqlCommand cmd = dal.GetCommand();
	cmd.CommandType = System.Data.CommandType.StoredProcedure;
	cmd.Parameters.AddWithValue("@UserId", UserId);
	cmd.Parameters.AddWithValue("@EntityId", EntityId);
	cmd.CommandText = "usp_GetAllProfession";
	try
	{
		System.Data.SqlClient.SqlDataReader reader = cmd.ExecuteReader();
		while (reader.Read())
		{
			BE.Profession beData = new BE.Profession();
			if (!(reader[0] is DBNull)) beData.ProfessionId = reader.GetInt32(0);
			if (!(reader[1] is DBNull)) beData.OrderNo = reader.GetInt32(1);
			if (!(reader[2] is DBNull)) beData.Code = reader.GetString(2);
			if (!(reader[3] is DBNull)) beData.ProfessionName = reader.GetString(3);
			if (!(reader[4] is DBNull)) beData.className = reader.GetString(4);
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
	public BE.Profession getProfessionById(int UserId, int EntityId, int ProfessionId)
{
	BE.Profession beData = new BE.Profession();
	dal.OpenConnection();
	System.Data.SqlClient.SqlCommand cmd = dal.GetCommand();
	cmd.CommandType = System.Data.CommandType.StoredProcedure;
	cmd.Parameters.AddWithValue("@ProfessionId", ProfessionId);
	cmd.Parameters.AddWithValue("@UserId", UserId);
	cmd.Parameters.AddWithValue("@EntityId", EntityId);
	cmd.CommandText = "usp_GetProfessionById";
	try
	{
		System.Data.SqlClient.SqlDataReader reader = cmd.ExecuteReader();
		if (reader.Read())
		{
			beData = new BE.Profession();
			if (!(reader[0] is DBNull)) beData.ProfessionId = reader.GetInt32(0);
			if (!(reader[1] is DBNull)) beData.OrderNo = reader.GetInt32(1);
			if (!(reader[2] is DBNull)) beData.Code = reader.GetString(2);
			if (!(reader[3] is DBNull)) beData.ProfessionName = reader.GetString(3);
			if (!(reader[4] is DBNull)) beData.className = reader.GetString(4);
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

