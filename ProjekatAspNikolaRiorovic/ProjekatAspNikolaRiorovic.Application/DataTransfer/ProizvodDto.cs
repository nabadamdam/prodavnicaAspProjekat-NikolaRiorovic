using System;
using System.Collections.Generic;
using System.Text;

namespace ProjekatAspNikolaRiorovic.Application.DataTransfer
{
    public class ProizvodDto
    {
        public string Naziv { get; set; }
        public int Kolicina { get; set; }
        public string Slika { get; set; }
        public string Opis { get; set; }
        public int IdKat { get; set; }

    }
}
