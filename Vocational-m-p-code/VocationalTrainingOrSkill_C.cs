#region "VocationalTrainingOrSkill"
	[HttpPost]
	[PermissionsAttribute(Actions.Save, (int)ENTITIES.ClassSetup, false)]
	public JsonNetResult SaveVocationalTrainingOrSkill()
	{
	ResponeValues resVal = new ResponeValues();
	try
	{
	var beData = DeserializeObject<AcademicLib.AcademicLib.BE.VocationalTrainingOrSkill>(Request["jsonData"]);
	if (beData != null)
	{
	beData.CUserId = User.UserId;
	if (!beData.VocationalId.HasValue)
	beData.VocationalId = 0;

	resVal = new AcademicLib.AcademicLib.BL.VocationalTrainingOrSkill(User.UserId, User.HostName, User.DBName).SaveFormData(beData);

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
	public JsonNetResult GetAllVocationalTrainingOrSkill()
	{
	var dataColl = new AcademicLib.AcademicLib.BL.VocationalTrainingOrSkill(User.UserId, User.HostName, User.DBName).GetAllVocationalTrainingOrSkill(0);
	return new JsonNetResult() { Data = dataColl, TotalCount = dataColl.Count, IsSuccess = dataColl.IsSuccess, ResponseMSG = dataColl.ResponseMSG };
	}
	[HttpPost]
	[HttpPost]
	public JsonNetResult GetVocationalTrainingOrSkillById(int VocationalId)
	{
	 var dataColl = new AcademicLib.AcademicLib.BL.VocationalTrainingOrSkill(User.UserId, User.HostName, User.DBName).GetVocationalTrainingOrSkillById(0, VocationalId);
	 return new JsonNetResult() { Data = dataColl, TotalCount = dataColl.IsSuccess ? 1 : 0, IsSuccess = dataColl.IsSuccess, ResponseMSG = dataColl.ResponseMSG };
	 }
	[HttpPost]
	[PermissionsAttribute(Actions.Delete, (int)ENTITIES.ClassSetup, false)]
	public JsonNetResult DelVocationalTrainingOrSkill(int VocationalId)
	{
	   ResponeValues resVal = new ResponeValues();
	  try
	  {
	  resVal = new AcademicLib.AcademicLib.BL.VocationalTrainingOrSkill(User.UserId, User.HostName, User.DBName).DeleteById(0, VocationalId);
	}
	catch (Exception ee)
	 {
	     resVal.IsSuccess = false;
	     resVal.ResponseMSG = ee.Message;
	 }
	 return new JsonNetResult() { Data = resVal, TotalCount = 0, IsSuccess = resVal.IsSuccess, ResponseMSG = resVal.ResponseMSG };
	 }
	#endregion
	