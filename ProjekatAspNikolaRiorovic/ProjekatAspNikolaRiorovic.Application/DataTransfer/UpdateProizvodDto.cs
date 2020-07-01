using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Text;

namespace ProjekatAspNikolaRiorovic.Application.DataTransfer
{
    public class UpdateProizvodDto
    {
        public int Id { get; set; }
        public string Naziv { get; set; }
        public string Opis { get; set; }
        public IFormFile Slika { get; set; }
        public int Kolicina { get; set; }
        public decimal Cena { get; set; }
    }
}
