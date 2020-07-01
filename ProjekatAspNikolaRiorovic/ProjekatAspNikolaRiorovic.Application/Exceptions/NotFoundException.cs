using System;
using System.Collections.Generic;
using System.Text;

namespace ProjekatAspNikolaRiorovic.Application.Exceptions
{
    public class NotFoundException : Exception
    {
        public NotFoundException(int id,Type type):base($"Entitet tipa{type.Name} sa id-em {id} nije pronadjen.")
        {

        }
    }
}
