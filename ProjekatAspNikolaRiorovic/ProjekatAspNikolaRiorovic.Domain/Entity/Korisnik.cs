using System;
using System.Collections.Generic;
using System.Text;

namespace ProjekatAspNikolaRiorovic.Domain.Entity
{
    public class Korisnik : Entity
    {
        public string Ime { get; set; }
        public string Prezime { get; set; }
        public long Jmbg { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public int IdUloga { get; set; }
        public virtual Uloga Uloga { get; set; }
        public virtual ICollection<KorisnikUseCase> KorisnikUseCases { get; set; }
        public virtual ICollection<Porudzbina> Porudzbine { get; set; }
    }
}
