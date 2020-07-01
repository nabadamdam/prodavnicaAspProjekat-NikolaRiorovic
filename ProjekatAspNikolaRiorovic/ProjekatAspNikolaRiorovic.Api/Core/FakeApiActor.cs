using ProjekatAspNikolaRiorovic.Application;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ProjekatAspNikolaRiorovic.Api.Core
{
    public class FakeApiActor : IActorInApp
    {
        public int Id => 1;

        public string Identifikator => "username";

        public IEnumerable<int> DozvoleZaKorisnika => new List<int> {1,3,4,5, 6 ,7 ,8, 9,10};
    }
    public class AdminFakeApiActor : IActorInApp
    {
        public int Id => 2;

        public string Identifikator => "admin";

        public IEnumerable<int> DozvoleZaKorisnika => Enumerable.Range(1,100);
    }
}
