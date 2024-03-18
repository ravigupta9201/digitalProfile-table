#region "Profession"
	[HttpPost]
	[PermissionsAttribute(Actions.Save, (int)ENTITIES.ClassSetup, false)]
	public JsonNetResult SaveProfession()
	{
	ResponeValues resVal = new ResponeValues();
	try
	{
	var beData = DeserializeObject<AcademicLib.AcademicLib.BE.Profession>(Request["jsonData"]);
	if (beData != null)
	{
	beData.CUserId = User.UserId;
	if (!beData.ProfessionId.HasValue)
	beData.ProfessionId = 0;

	resVal = new AcademicLib.AcademicLib.BL.Profession(User.UserId, User.HostName, User.DBName).SaveFormData(beData);

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
	public JsonNetResult GetAllProfession()
	{
	var dataColl = new AcademicLib.AcademicLib.BL.Profession(User.UserId, User.HostName, User.DBName).GetAllProfession(0);
	return new JsonNetResult() { Data = dataColl, TotalCount = dataColl.Count, IsSuccess = dataColl.IsSuccess, ResponseMSG = dataColl.ResponseMSG };
	}
	[HttpPost]
	[HttpPost]
	public JsonNetResult GetProfessionById(int ProfessionId)
	{
	 var dataColl = new AcademicLib.AcademicLib.BL.Profession(User.UserId, User.HostName, User.DBName).GetProfessionById(0, ProfessionId);
	 return new JsonNetResult() { Data = dataColl, TotalCount = dataColl.IsSuccess ? 1 : 0, IsSuccess = dataColl.IsSuccess, ResponseMSG = dataColl.ResponseMSG };
	 }
	[HttpPost]
	[PermissionsAttribute(Actions.Delete, (int)ENTITIES.ClassSetup, false)]
	public JsonNetResult DelProfession(int ProfessionId)
	{
	   ResponeValues resVal = new ResponeValues();
	  try
	  {
	  resVal = new AcademicLib.AcademicLib.BL.Profession(User.UserId, User.HostName, User.DBName).DeleteById(0, ProfessionId);
	}
	catch (Exception ee)
	 {
	     resVal.IsSuccess = false;
	     resVal.ResponseMSG = ee.Message;
	 }
	 return new JsonNetResult() { Data = resVal, TotalCount = 0, IsSuccess = resVal.IsSuccess, ResponseMSG = resVal.ResponseMSG };
	 }
	#endregion
	