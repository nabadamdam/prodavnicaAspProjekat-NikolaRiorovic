using ProjekatAspNikolaRiorovic.Application.Queries;
using System;
using System.Collections.Generic;
using System.Text;

namespace ProjekatAspNikolaRiorovic.Application.Searches
{
    public class PorudzbinaSearch : PagedSearch
    {
        public DateTime DatumPorudzbine { get; set; }
    }
}
