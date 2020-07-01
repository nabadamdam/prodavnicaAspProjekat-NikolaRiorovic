using System;
using System.Collections.Generic;
using System.Text;

namespace ProjekatAspNikolaRiorovic.Application.DataTransfer
{
    public class PicturesForProductDto
    {
        public int Id { get; set; }
        public int IdProizvod { get; set; }
        public string PutanjaSlike { get; set; }
       
    }
}
