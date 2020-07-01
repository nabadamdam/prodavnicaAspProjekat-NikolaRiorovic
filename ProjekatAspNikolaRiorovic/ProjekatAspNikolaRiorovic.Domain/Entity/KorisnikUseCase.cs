using System;
using System.Collections.Generic;
using System.Text;

namespace ProjekatAspNikolaRiorovic.Domain.Entity
{
    public class KorisnikUseCase
    {
        public int Id { get; set; }
        public int  IdKorisnik { get; set; }
        public int IdUseCase { get; set; }
        public virtual Korisnik Korisnik { get; set; }

    }
}
