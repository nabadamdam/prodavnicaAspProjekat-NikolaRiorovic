using ProjekatAspNikolaRiorovic.Application;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ProjekatAspNikolaRiorovic.Api.Core
{
    public class UnAuthorizedActor : IActorInApp
    {
        public int Id => 0;

        public string Identifikator => "Not authorized actor";

        public IEnumerable<int> DozvoleZaKorisnika => new List<int> { 2,23,26};
    }
}
