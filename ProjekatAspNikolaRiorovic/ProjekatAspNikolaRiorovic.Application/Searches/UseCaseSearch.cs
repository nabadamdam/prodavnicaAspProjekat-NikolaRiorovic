using ProjekatAspNikolaRiorovic.Application.Queries;
using System;
using System.Collections.Generic;
using System.Text;

namespace ProjekatAspNikolaRiorovic.Application.Searches
{
    public class UseCaseSearch : PagedSearch
    {
        public string Email { get; set; }
        public DateTime DatumOd { get; set; }
        public DateTime DatumDo { get; set; }
        public string Naziv { get; set; }
        public bool NotAutorizedActor { get; set; }
    }
}
