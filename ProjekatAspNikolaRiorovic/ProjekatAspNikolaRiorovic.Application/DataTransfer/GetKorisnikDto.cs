using System;
using System.Collections.Generic;
using System.Text;

namespace ProjekatAspNikolaRiorovic.Application.DataTransfer
{
    public class GetKorisnikDto
    {
        public int Id { get; set; }
        public string Ime { get; set; }
        public string Prezime { get; set; }
        public long Jmbg { get; set; }
        public string Email { get; set;}
        public string NazivUloge { get; set; }
    }
}
