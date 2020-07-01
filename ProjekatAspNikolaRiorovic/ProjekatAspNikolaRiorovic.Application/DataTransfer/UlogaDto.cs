using System;
using System.Collections.Generic;
using System.Text;

namespace ProjekatAspNikolaRiorovic.Application.DataTransfer
{
    public class UlogaDto
    {
        public string Naziv { get; set; }
    }
    public class UlogaWithIdDto : UlogaDto
    {
        public int IdUloga { get; set; }
    }
   
}
