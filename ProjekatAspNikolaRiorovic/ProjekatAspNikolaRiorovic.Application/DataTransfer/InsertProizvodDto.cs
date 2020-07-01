using Microsoft.AspNetCore.Http;
using ProjekatAspNikolaRiorovic.Domain.Entity;
using System;
using System.Collections.Generic;
using System.Text;

namespace ProjekatAspNikolaRiorovic.Application.DataTransfer
{
    public class InsertProizvodDto
    {
        public string Naziv { get; set; }
        public int Kolicina { get; set; }
        public decimal Cena { get; set; }
        public string Opis { get; set; }
        public int IdKat { get; set; }
        public virtual ICollection<IFormFile> Slike { get; set; }
    }
}
