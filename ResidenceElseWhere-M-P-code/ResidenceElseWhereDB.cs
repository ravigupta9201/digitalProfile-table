using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dynamic.DataAccess.Global;

namespace AcademicLib.DA.
{

	internal class ResidenceElseWhereDB
	{ 

	public ResponeValues SaveUpdate(BE.ResidenceElseWhere beData , bool isModify)
{
	ResponeValues resVal = new ResponeValues();
	dal.OpenConnection();
	System.Data.SqlClient.SqlCommand cmd = dal.GetCommand();
	cmd.CommandType = System.Data.CommandType.StoredProcedure;
	cmd.Parameters.AddWithValue("@OrderNo",beData.OrderNo);
	cmd.Parameters.AddWithValue("@Code",beData.Code);
	cmd.Parameters.AddWithValue("@MaritalStatusName",beData.MaritalStatusName);
	cmd.Parameters.AddWithValue("@Status",beData.Status);
	
	cmd.Parameters.AddWithValue("@UserId",beData.CUserId);
	cmd.Parameters.AddWithValue("@EntityId",beData.EntityId);
	cmd.Parameters.AddWithValue("@ResidenceElseWhereId",beData.ResidenceElseWhereId);
	
	if (isModify)
	{
		cmd.CommandText = "usp_UpdateResidenceElseWhere";
	}
	else
	{
		cmd.Parameters[6].Direction = System.Data.ParameterDirection.Output;
		cmd.CommandText = "usp_AddResidenceElseWhere";
	}
	cmd.Parameters.Add("@ResponseMSG", System.Data.SqlDbType.NVarChar, 254);
	cmd.Parameters.Add("@IsSuccess", System.Data.SqlDbType.Bit);
	cmd.Parameters.Add("@ErrorNumber", System.Data.SqlDbType.Int);
	cmd.Parameters[7].Direction = System.Data.ParameterDirection.Output;
	cmd.Parameters[8].Direction = System.Data.ParameterDirection.Output;
	cmd.Parameters[9].Direction = System.Data.ParameterDirection.Output;
	try
	{
		cmd.ExecuteNonQuery();
		if (!(cmd.Parameters[6].Value is DBNull))
			resVal.RId = Convert.ToInt32(cmd.Parameters[6].Value);

		if (!(cmd.Parameters[7].Value is DBNull))
			resVal.ResponseMSG = Convert.ToString(cmd.Parameters[7].Value);

		if (!(cmd.Parameters[8].Value is DBNull))
			resVal.IsSuccess = Convert.ToBoolean(cmd.Parameters[8].Value);

		if (!(cmd.Parameters[9].Value is DBNull))
			resVal.ErrorNumber = Convert.ToInt32(cmd.Parameters[9].Value);

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

	public ResponeValues DeleteById(int UserId, int EntityId, int ResidenceElseWhereId)
{
	ResponeValues resVal = new ResponeValues();
	dal.OpenConnection();
	System.Data.SqlClient.SqlCommand cmd = dal.GetCommand();
	cmd.CommandType = System.Data.CommandType.StoredProcedure;
	cmd.Parameters.AddWithValue("@UserId", UserId);
	cmd.Parameters.AddWithValue("@EntityId", EntityId);
	cmd.Parameters.AddWithValue("@ResidenceElseWhereId", ResidenceElseWhereId);
	cmd.CommandText = "usp_DelResidenceElseWhereById";
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
	public BE.ResidenceElseWhereCollections getAllResidenceElseWhere(int UserId, int EntityId)
{
	BE.ResidenceElseWhereCollections dataColl = new BE.ResidenceElseWhereCollections();
	dal.OpenConnection();
	System.Data.SqlClient.SqlCommand cmd = dal.GetCommand();
	cmd.CommandType = System.Data.CommandType.StoredProcedure;
	cmd.Parameters.AddWithValue("@UserId", UserId);
	cmd.Parameters.AddWithValue("@EntityId", EntityId);
	cmd.CommandText = "usp_GetAllResidenceElseWhere";
	try
	{
		System.Data.SqlClient.SqlDataReader reader = cmd.ExecuteReader();
		while (reader.Read())
		{
			BE.ResidenceElseWhere beData = new BE.ResidenceElseWhere();
			if (!(reader[0] is DBNull)) beData.ResidenceElseWhereId = reader.GetInt32(0);
			if (!(reader[1] is DBNull)) beData.OrderNo = reader.GetInt32(1);
			if (!(reader[2] is DBNull)) beData.Code = reader.GetString(2);
			if (!(reader[3] is DBNull)) beData.MaritalStatusName = reader.GetString(3);
			if (!(reader[4] is DBNull)) beData.Status = Convert.ToBoolean(reader[4]);
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
	public BE.ResidenceElseWhere getResidenceElseWhereById(int UserId, int EntityId, int ResidenceElseWhereId)
{
	BE.ResidenceElseWhere beData = new BE.ResidenceElseWhere();
	dal.OpenConnection();
	System.Data.SqlClient.SqlCommand cmd = dal.GetCommand();
	cmd.CommandType = System.Data.CommandType.StoredProcedure;
	cmd.Parameters.AddWithValue("@ResidenceElseWhereId", ResidenceElseWhereId);
	cmd.Parameters.AddWithValue("@UserId", UserId);
	cmd.Parameters.AddWithValue("@EntityId", EntityId);
	cmd.CommandText = "usp_GetResidenceElseWhereById";
	try
	{
		System.Data.SqlClient.SqlDataReader reader = cmd.ExecuteReader();
		if (reader.Read())
		{
			beData = new BE.ResidenceElseWhere();
			if (!(reader[0] is DBNull)) beData.ResidenceElseWhereId = reader.GetInt32(0);
			if (!(reader[1] is DBNull)) beData.OrderNo = reader.GetInt32(1);
			if (!(reader[2] is DBNull)) beData.Code = reader.GetString(2);
			if (!(reader[3] is DBNull)) beData.MaritalStatusName = reader.GetString(3);
			if (!(reader[4] is DBNull)) beData.Status = Convert.ToBoolean(reader[4]);
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

