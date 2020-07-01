using System;
using System.Collections.Generic;
using System.Text;

namespace ProjekatAspNikolaRiorovic.Domain.Entity
{
    public class Uloga : Entity
    {
        public string Naziv { get; set; }
        public virtual ICollection<Korisnik> Korisnici { get; set; }
    }
}
