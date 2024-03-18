using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dynamic.DataAccess.Global;

namespace ProfileLib.BE
{

	public class VocationalTrainingOrSkill : ResponeValues
	{

		public int? VocationalId { get; set; }
		public int OrderNo { get; set; }
		public string Code { get; set; } = "";
		public string TrainingSubjectName { get; set; } = "";
		public string TrainingAreasName { get; set; } = "";
		public bool Status { get; set; }
	}

	public class VocationalTrainingOrSkillCollections : System.Collections.Generic.List<VocationalTrainingOrSkill>
	{
		public VocationalTrainingOrSkillCollections()
		{
			ResponseMSG = "";
		}
		public string ResponseMSG { get; set; }
		public bool IsSuccess { get; set; }
	}


}

