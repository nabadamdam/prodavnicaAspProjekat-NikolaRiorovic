using ProjekatAspNikolaRiorovic.Domain.Entity;
using System;
using System.Collections.Generic;
using System.Text;

namespace ProjekatAspNikolaRiorovic.Application.DataTransfer
{
    public class GetPorudzbinaDto
    {
        public string Adresa { get; set; }
        public StatusPorudzbine StatusPorudzbine { get; set; }
        public NacinPlacanja NacinPlacanja { get; set; }
        public string ImeKorisnika { get; set; }
        public string PrezimeKorisnka { get; set; }
        public long Jmbg { get; set; }
        public IEnumerable<string> NazivProizvoda { get; set; }
        public IEnumerable<int> Kolicina { get; set; }
        public IEnumerable<decimal> Cena { get; set; }
    }
}
