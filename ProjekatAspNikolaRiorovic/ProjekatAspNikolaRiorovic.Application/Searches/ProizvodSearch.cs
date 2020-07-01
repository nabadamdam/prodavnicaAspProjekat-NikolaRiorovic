using ProjekatAspNikolaRiorovic.Application.Queries;
using System;
using System.Collections.Generic;
using System.Text;

namespace ProjekatAspNikolaRiorovic.Application.Searches
{
    public class ProizvodSearch : PagedSearch
    {
        public int IdKat { get; set; }
        public string Naziv { get; set; }
    }
}
