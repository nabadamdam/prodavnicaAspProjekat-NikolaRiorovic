using System;
using System.Collections.Generic;
using System.Text;

namespace ProjekatAspNikolaRiorovic.Domain.Entity
{
    public class Cenovnik : Entity
    {
        public decimal CenaProizvod { get; set; }
      
        public int IdProizvod { get; set; }
        public virtual Proizvod Proizvod { get; set; }
    }
}
