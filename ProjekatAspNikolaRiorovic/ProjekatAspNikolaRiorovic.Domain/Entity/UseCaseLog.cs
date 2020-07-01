using System;
using System.Collections.Generic;
using System.Text;

namespace ProjekatAspNikolaRiorovic.Domain.Entity
{
    public class UseCaseLog
    {
        public int Id { get; set; }
        public string NazivUseCase { get; set; }
        public DateTime Datum { get; set; }
        public string Podaci { get; set; }
        public string Actor { get; set; }
    }
}
