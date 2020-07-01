using ProjekatAspNikolaRiorovic.Domain.Entity;
using System;
using System.Collections.Generic;
using System.Text;

namespace ProjekatAspNikolaRiorovic.Application.DataTransfer
{
    public class PravljenjePorudzbineDto
    {
        public DateTime DatumPorudzbine { get; set; }
        public string Adresa { get; set; }
        public IEnumerable<PravljenjeDetaljaPorudzbineDto> Stavke { get; set; } = new List<PravljenjeDetaljaPorudzbineDto>();
    }
    public class PravljenjeDetaljaPorudzbineDto
    {
        public int IdProduct { get; set; }
        public int IdCenovnik { get; set; }
        public int Kolicina { get; set; }
    }
    public class PromenaStatusaPorudzbineDto
    {
        public int IdPorudzbine { get; set; }
        public StatusPorudzbine  Status { get; set; }
    }
}
