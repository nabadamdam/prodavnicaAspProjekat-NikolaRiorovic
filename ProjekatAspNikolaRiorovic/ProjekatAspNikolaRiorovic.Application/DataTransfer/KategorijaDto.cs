using System;
using System.Collections.Generic;
using System.Text;

namespace ProjekatAspNikolaRiorovic.Application.DataTransfer
{
    public class KategorijaDto
    {
        public string Naziv { get; set; }
    }
    public class KategorijaWithIdDto : KategorijaDto
    {
        public int Id { get; set; }
    }
}
