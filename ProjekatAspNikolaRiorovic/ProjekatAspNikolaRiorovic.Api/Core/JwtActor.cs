using ProjekatAspNikolaRiorovic.Application;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ProjekatAspNikolaRiorovic.Api.Core
{
    public class JwtActor : IActorInApp
    {
        public int Id { get; set; }

        public string Identifikator { get; set; }

        public IEnumerable<int> DozvoleZaKorisnika { get; set; }
    }
}
