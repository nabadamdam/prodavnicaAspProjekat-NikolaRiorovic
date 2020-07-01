using System;
using System.Collections.Generic;
using System.Text;

namespace ProjekatAspNikolaRiorovic.Application.Queries
{
    public class PagedResponse<T> where T : class
    {
        public int UkupniBrojStavki { get; set; }
        public int TrenutnaStrana { get; set; }
        public int StavkePoStranici { get; set; }
        public IEnumerable<T> Stavke { get; set; }
        public int BrojStranica => (int)Math.Ceiling((float)UkupniBrojStavki / StavkePoStranici);
    }
}
