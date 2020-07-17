using System;
using System.Collections.Generic;
using System.Text;

namespace NestoIspitAsp.Application
{
    public interface IActorApp
    {
        public int Id { get; }
        public string Identifikator { get; }
        public IEnumerable<int> ListaDozvoljenihUseCase { get; }
    }
}
