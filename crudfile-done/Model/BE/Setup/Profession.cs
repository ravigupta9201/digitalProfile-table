using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dynamic.DataAccess.Global;

namespace ProfileLib.BE
{

	public class Profession : ResponeValues
	{

		public int? ProfessionId { get; set; }
		public int OrderNo { get; set; }
		public string Code { get; set; } = "";
		public string ProfessionName { get; set; } = "";
		public string className { get; set; } = "";
		public bool Status { get; set; }
	}


	public class ProfessionCollections : System.Collections.Generic.List<Profession>
	{
		public ProfessionCollections()
		{
			ResponseMSG = "";
		}
		public string ResponseMSG { get; set; }
		public bool IsSuccess { get; set; }
	}

}

