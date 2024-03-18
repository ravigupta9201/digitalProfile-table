using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dynamic.DataAccess.Global;

namespace ProfileLib.BE
{

	public class MarriedStatus : ResponeValues
	{

		public int? MarriedStatusId { get; set; }
		public int OrderNo { get; set; }
		public string Code { get; set; } = "";
		public string MarriedStatusName { get; set; } = "";
		public bool Status { get; set; }
	}

	public class MarriedStatusCollections : System.Collections.Generic.List<MarriedStatus>
	{
		public MarriedStatusCollections()
		{
			ResponseMSG = "";
		}
		public string ResponseMSG { get; set; }
		public bool IsSuccess { get; set; }
	}

}

