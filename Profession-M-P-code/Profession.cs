using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dynamic.DataAccess.Global;

namespace AcademicLib.BE.
{

	public class Profession : ResponeValues 
	{ 

		public int? ProfessionId { get; set; } 
		public int OrderNo { get; set; } 
		public string Code { get; set; } ="" ; 
		public string ProfessionName { get; set; } ="" ; 
		public string className { get; set; } ="" ; 
		public bool Status { get; set; } 
		}

}

