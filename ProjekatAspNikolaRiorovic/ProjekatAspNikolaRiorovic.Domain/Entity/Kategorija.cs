using System;
using System.Collections.Generic;
using System.Text;

namespace ProjekatAspNikolaRiorovic.Domain.Entity
{
    public class Kategorija : Entity
    {
        public string Naziv { get; set; }

        public virtual ICollection<Proizvod> Proizvodi { get; set; }
    }
}
