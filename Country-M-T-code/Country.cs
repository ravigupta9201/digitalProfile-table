using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dynamic.DataAccess.Global;

namespace AcademicLib.BE.
{

	public class Country : ResponeValues 
	{ 

		public int? CountryId { get; set; } 
		public int OrderNo { get; set; } 
		public string Code { get; set; } ="" ; 
		public string CountryName { get; set; } ="" ; 
		public bool Status { get; set; } 
		}

}

