using System;
using System.Collections.Generic;
using System.Text;

namespace ProjekatAspNikolaRiorovic.Domain.Entity
{
    public class DetaljiPorudzbine : Entity
    {
        public string NazivProizvoda { get; set; }
        public int Kolicina { get; set; }
        public Decimal Cena { get; set; }
        public int IdPorudzbina { get; set; }
        public int? IdProizvod { get; set; }
        public virtual Porudzbina Porudzbina { get; set; }
        public virtual Proizvod Proizvod { get; set; }
    }
}
