#region "DistrictList"
	[HttpPost]
	[PermissionsAttribute(Actions.Save, (int)ENTITIES.ClassSetup, false)]
	public JsonNetResult SaveDistrictList()
	{
	ResponeValues resVal = new ResponeValues();
	try
	{
	var beData = DeserializeObject<AcademicLib.AcademicLib.BE.DistrictList>(Request["jsonData"]);
	if (beData != null)
	{
	beData.CUserId = User.UserId;
	if (!beData.DId.HasValue)
	beData.DId = 0;

	resVal = new AcademicLib.AcademicLib.BL.DistrictList(User.UserId, User.HostName, User.DBName).SaveFormData(beData);

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
	public JsonNetResult GetAllDistrictList()
	{
	var dataColl = new AcademicLib.AcademicLib.BL.DistrictList(User.UserId, User.HostName, User.DBName).GetAllDistrictList(0);
	return new JsonNetResult() { Data = dataColl, TotalCount = dataColl.Count, IsSuccess = dataColl.IsSuccess, ResponseMSG = dataColl.ResponseMSG };
	}
	[HttpPost]
	[HttpPost]
	public JsonNetResult GetDistrictListById(int DId)
	{
	 var dataColl = new AcademicLib.AcademicLib.BL.DistrictList(User.UserId, User.HostName, User.DBName).GetDistrictListById(0, DId);
	 return new JsonNetResult() { Data = dataColl, TotalCount = dataColl.IsSuccess ? 1 : 0, IsSuccess = dataColl.IsSuccess, ResponseMSG = dataColl.ResponseMSG };
	 }
	[HttpPost]
	[PermissionsAttribute(Actions.Delete, (int)ENTITIES.ClassSetup, false)]
	public JsonNetResult DelDistrictList(int DId)
	{
	   ResponeValues resVal = new ResponeValues();
	  try
	  {
	  resVal = new AcademicLib.AcademicLib.BL.DistrictList(User.UserId, User.HostName, User.DBName).DeleteById(0, DId);
	}
	catch (Exception ee)
	 {
	     resVal.IsSuccess = false;
	     resVal.ResponseMSG = ee.Message;
	 }
	 return new JsonNetResult() { Data = resVal, TotalCount = 0, IsSuccess = resVal.IsSuccess, ResponseMSG = resVal.ResponseMSG };
	 }
	#endregion
	