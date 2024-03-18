using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dynamic.DataAccess.Global;

namespace ProfileLib.BE
{

	public class ResidenceElseWhere : ResponeValues
	{

		public int? ResidenceElseWhereId { get; set; }
		public int OrderNo { get; set; }
		public string Code { get; set; } = "";
		public string MaritalStatusName { get; set; } = "";
		public bool Status { get; set; }
	}


	public class ResidenceElseWhereCollections : System.Collections.Generic.List<ResidenceElseWhere>
	{
		public ResidenceElseWhereCollections()
		{
			ResponseMSG = "";
		}
		public string ResponseMSG { get; set; }
		public bool IsSuccess { get; set; }
	}


}

