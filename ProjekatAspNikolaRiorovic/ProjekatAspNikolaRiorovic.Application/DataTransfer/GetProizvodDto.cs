using System;
using System.Collections.Generic;
using System.Text;

namespace ProjekatAspNikolaRiorovic.Application.DataTransfer
{
    public class GetProizvodDto
    {
        public string Naziv { get; set; }
        public int Kolicina { get; set; }
        public string Slika { get; set; }
        public IEnumerable<string> Slike{ get; set; }
        public string Opis { get; set; }
        public decimal Cena { get; set; }
        public int IdKat { get; set; }
    }
}
