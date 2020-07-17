using NestoIspitAsp.Application;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace NestoIspitAsp.Api.Core
{
    public class JwtActor : IActorApp
    {
        public int Id { get; set; }

        public string Identifikator { get; set; }

        public IEnumerable<int> ListaDozvoljenihUseCase { get; set; }
    }
}
