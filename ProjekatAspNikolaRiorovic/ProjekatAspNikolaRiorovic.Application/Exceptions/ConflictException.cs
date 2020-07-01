using System;
using System.Collections.Generic;
using System.Text;

namespace ProjekatAspNikolaRiorovic.Application.Exceptions
{
    public class ConflictException : Exception
    {
        public ConflictException(string name, Type type) : base($"{name} vec postoji u tabeli {type.Name}")
        {

        }
    }
}
