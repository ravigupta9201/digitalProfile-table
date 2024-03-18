using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dynamic.DataAccess.Global;

namespace ProfileLib.BE
{

	public class Country : ResponeValues
	{

		public int? CountryId { get; set; }
		public int OrderNo { get; set; }
		public string Code { get; set; } = "";
		public string CountryName { get; set; } = "";
		public bool Status { get; set; }
	}

	public class CountryCollections : System.Collections.Generic.List<Country>
	{
		public CountryCollections()
		{
			ResponseMSG = "";
		}
		public string ResponseMSG { get; set; }
		public bool IsSuccess { get; set; }
	}

}

