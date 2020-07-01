using ProjekatAspNikolaRiorovic.Application.Queries;
using System;
using System.Collections.Generic;
using System.Text;

namespace ProjekatAspNikolaRiorovic.Application.Searches
{
    public class UlogaSearch : PagedSearch
    {
        public string Naziv { get; set; }
    }
}
