using System;
using System.Collections.Generic;
using System.Reflection.Metadata;
using System.Text;

namespace ProjekatAspNikolaRiorovic.Domain.Entity
{
    public class Porudzbina : Entity
    {
        public DateTime DatumPorudzbine { get; set; }
        public string Adresa { get; set; }
        public StatusPorudzbine StatusPorudzbine { get; set; }
        public NacinPlacanja NacinPlacanja { get; set; }
        public int IdKorisnik { get; set; }
        public virtual Korisnik Korisnik { get; set; }
        public virtual ICollection<DetaljiPorudzbine> DetaljiPorudzbina { get; set; } = new HashSet<DetaljiPorudzbine>();
    }
    public enum StatusPorudzbine
    {
        primljena,
        poslata,
        isporucena,
        otkazana
    }
    public enum NacinPlacanja
    {
        kes,
        kartica,
        online
    }
}
