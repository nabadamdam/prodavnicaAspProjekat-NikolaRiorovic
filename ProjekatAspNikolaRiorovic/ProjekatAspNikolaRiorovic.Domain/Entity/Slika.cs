using System;
using System.Collections.Generic;
using System.Text;

namespace ProjekatAspNikolaRiorovic.Domain.Entity
{
    public class Slika : Entity
    {
        public string Putanja { get; set; }

        public int IdProizvod { get; set; }

        public virtual Proizvod Proizvod { get; set; }
    }
}
