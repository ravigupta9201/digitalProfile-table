using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dynamic.DataAccess.Global;

namespace ProfileLib.BE
{

	public class DistrictList : ResponeValues
	{

		public int? DId { get; set; }
		public int OrderNo { get; set; }
		public string Code { get; set; } = "";
		public string DistrictName { get; set; } = "";
		public string ProvinceName { get; set; } = "";
		public bool Status { get; set; }
	}


	public class DistrictListCollections : System.Collections.Generic.List<DistrictList>
	{
		public DistrictListCollections()
		{
			ResponseMSG = "";
		}
		public string ResponseMSG { get; set; }
		public bool IsSuccess { get; set; }
	}

}

