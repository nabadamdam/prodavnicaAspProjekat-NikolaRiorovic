using System;
using System.Collections.Generic;
using System.Text;

namespace ProjekatAspNikolaRiorovic.Application.DataTransfer
{
    public class UseCaseDto
    {
        public string NazivUseCase { get; set; }
        public DateTime Datum { get; set; }
        public string Podaci { get; set; }
        public string Actor { get; set; }

    }

}
