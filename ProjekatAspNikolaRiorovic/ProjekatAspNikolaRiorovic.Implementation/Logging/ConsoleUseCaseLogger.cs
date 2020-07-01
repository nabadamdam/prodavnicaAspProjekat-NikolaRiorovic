using Newtonsoft.Json;
using ProjekatAspNikolaRiorovic.Application;
using System;
using System.Collections.Generic;
using System.Text;

namespace ProjekatAspNikolaRiorovic.Implementation.Logging
{
    public class ConsoleUseCaseLogger : IUseCaseLogger
    {
        public void Log(IUseCase useCase, IActorInApp actor,object data)
        {
            Console.WriteLine($"Korisnik : {actor.Identifikator}" +
                $" pokusava da izvrsi  {useCase.Opis} sa podacima: ${JsonConvert.SerializeObject(data)}" +
                $".Vreme pokusaja izvrsavanja je {DateTime.Now}");
        }
    }
}
