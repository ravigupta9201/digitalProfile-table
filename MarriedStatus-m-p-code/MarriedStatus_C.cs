#region "MarriedStatus"
	[HttpPost]
	[PermissionsAttribute(Actions.Save, (int)ENTITIES.ClassSetup, false)]
	public JsonNetResult SaveMarriedStatus()
	{
	ResponeValues resVal = new ResponeValues();
	try
	{
	var beData = DeserializeObject<AcademicLib.AcademicLib.BE.MarriedStatus>(Request["jsonData"]);
	if (beData != null)
	{
	beData.CUserId = User.UserId;
	if (!beData.MarriedStatusId.HasValue)
	beData.MarriedStatusId = 0;

	resVal = new AcademicLib.AcademicLib.BL.MarriedStatus(User.UserId, User.HostName, User.DBName).SaveFormData(beData);

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
	public JsonNetResult GetAllMarriedStatus()
	{
	var dataColl = new AcademicLib.AcademicLib.BL.MarriedStatus(User.UserId, User.HostName, User.DBName).GetAllMarriedStatus(0);
	return new JsonNetResult() { Data = dataColl, TotalCount = dataColl.Count, IsSuccess = dataColl.IsSuccess, ResponseMSG = dataColl.ResponseMSG };
	}
	[HttpPost]
	[HttpPost]
	public JsonNetResult GetMarriedStatusById(int MarriedStatusId)
	{
	 var dataColl = new AcademicLib.AcademicLib.BL.MarriedStatus(User.UserId, User.HostName, User.DBName).GetMarriedStatusById(0, MarriedStatusId);
	 return new JsonNetResult() { Data = dataColl, TotalCount = dataColl.IsSuccess ? 1 : 0, IsSuccess = dataColl.IsSuccess, ResponseMSG = dataColl.ResponseMSG };
	 }
	[HttpPost]
	[PermissionsAttribute(Actions.Delete, (int)ENTITIES.ClassSetup, false)]
	public JsonNetResult DelMarriedStatus(int MarriedStatusId)
	{
	   ResponeValues resVal = new ResponeValues();
	  try
	  {
	  resVal = new AcademicLib.AcademicLib.BL.MarriedStatus(User.UserId, User.HostName, User.DBName).DeleteById(0, MarriedStatusId);
	}
	catch (Exception ee)
	 {
	     resVal.IsSuccess = false;
	     resVal.ResponseMSG = ee.Message;
	 }
	 return new JsonNetResult() { Data = resVal, TotalCount = 0, IsSuccess = resVal.IsSuccess, ResponseMSG = resVal.ResponseMSG };
	 }
	#endregion
	