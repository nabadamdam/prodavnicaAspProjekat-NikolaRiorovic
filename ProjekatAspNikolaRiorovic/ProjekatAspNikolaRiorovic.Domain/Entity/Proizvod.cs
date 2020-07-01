using System;
using System.Collections.Generic;
using System.Text;

namespace ProjekatAspNikolaRiorovic.Domain.Entity
{
    public class Proizvod : Entity
    {
        public string Naziv { get; set; }
        public int Kolicina { get; set; }
        public string Slika { get; set; }
        public string Opis { get; set; }
        public int IdKat { get; set; }
        public virtual Kategorija Kategorija { get; set; }
        public virtual ICollection<Cenovnik> Cenovnici { get; set; }
        public virtual ICollection<Slika> Slike { get; set; }
        public virtual ICollection<DetaljiPorudzbine> DetaljiPorudzbina { get; set; } = new HashSet<DetaljiPorudzbine>();
    }
}
