#region "ResidenceElseWhere"
	[HttpPost]
	[PermissionsAttribute(Actions.Save, (int)ENTITIES.ClassSetup, false)]
	public JsonNetResult SaveResidenceElseWhere()
	{
	ResponeValues resVal = new ResponeValues();
	try
	{
	var beData = DeserializeObject<AcademicLib.AcademicLib.BE.ResidenceElseWhere>(Request["jsonData"]);
	if (beData != null)
	{
	beData.CUserId = User.UserId;
	if (!beData.ResidenceElseWhereId.HasValue)
	beData.ResidenceElseWhereId = 0;

	resVal = new AcademicLib.AcademicLib.BL.ResidenceElseWhere(User.UserId, User.HostName, User.DBName).SaveFormData(beData);

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
	public JsonNetResult GetAllResidenceElseWhere()
	{
	var dataColl = new AcademicLib.AcademicLib.BL.ResidenceElseWhere(User.UserId, User.HostName, User.DBName).GetAllResidenceElseWhere(0);
	return new JsonNetResult() { Data = dataColl, TotalCount = dataColl.Count, IsSuccess = dataColl.IsSuccess, ResponseMSG = dataColl.ResponseMSG };
	}
	[HttpPost]
	[HttpPost]
	public JsonNetResult GetResidenceElseWhereById(int ResidenceElseWhereId)
	{
	 var dataColl = new AcademicLib.AcademicLib.BL.ResidenceElseWhere(User.UserId, User.HostName, User.DBName).GetResidenceElseWhereById(0, ResidenceElseWhereId);
	 return new JsonNetResult() { Data = dataColl, TotalCount = dataColl.IsSuccess ? 1 : 0, IsSuccess = dataColl.IsSuccess, ResponseMSG = dataColl.ResponseMSG };
	 }
	[HttpPost]
	[PermissionsAttribute(Actions.Delete, (int)ENTITIES.ClassSetup, false)]
	public JsonNetResult DelResidenceElseWhere(int ResidenceElseWhereId)
	{
	   ResponeValues resVal = new ResponeValues();
	  try
	  {
	  resVal = new AcademicLib.AcademicLib.BL.ResidenceElseWhere(User.UserId, User.HostName, User.DBName).DeleteById(0, ResidenceElseWhereId);
	}
	catch (Exception ee)
	 {
	     resVal.IsSuccess = false;
	     resVal.ResponseMSG = ee.Message;
	 }
	 return new JsonNetResult() { Data = resVal, TotalCount = 0, IsSuccess = resVal.IsSuccess, ResponseMSG = resVal.ResponseMSG };
	 }
	#endregion
	