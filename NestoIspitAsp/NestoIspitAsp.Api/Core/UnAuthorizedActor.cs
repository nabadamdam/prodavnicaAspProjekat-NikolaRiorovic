using NestoIspitAsp.Application;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace NestoIspitAsp.Api.Core
{
    public class UnAuthorizedActor : IActorApp
    {
        public int Id => 0;

        public string Identifikator => "Neautorizovani korisnik!";

        public IEnumerable<int> ListaDozvoljenihUseCase =>new List<int> {1,2,3 };
    }
}
