using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Text;

namespace ProjekatAspNikolaRiorovic.Application.DataTransfer
{
    public class SlikaDto
    {
        public ICollection<IFormFile> Putanje { get; set; }

        public int IdProizvod { get; set; }

    }
}
