using System;
using System.Collections.Generic;
using System.Text;

namespace ProjekatAspNikolaRiorovic.Application
{
    public interface IActorInApp
    {
        int Id { get; }

        string Identifikator { get; } //Moze biti bilo koji jedinstveni podatak tipa string za konkretnog usera.

        IEnumerable<int> DozvoleZaKorisnika { get; }
    }
}
