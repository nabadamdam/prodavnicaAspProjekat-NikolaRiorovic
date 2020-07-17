using NestoIspitAsp.Application.Queries;
using System;
using System.Collections.Generic;
using System.Text;

namespace NestoIspitAsp.Application.Searches
{
    public class InvoiceSearch : PageSearch
    {
        public string NazivPesme { get; set; }
        public int IdKupca { get; set; }
        public string KompanijaKupca { get; set; }
        public string DrzavaKupca { get; set; }
        public decimal MinimalnaCena { get; set; }
        public decimal MaxCena { get; set; }
    }
}
