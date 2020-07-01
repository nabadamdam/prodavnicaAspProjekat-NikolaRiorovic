using System;
using System.Collections.Generic;
using System.Text;

namespace ProjekatAspNikolaRiorovic.Application.Exceptions
{
    public class NotAutorizedUseCaseException : Exception
    {
        public NotAutorizedUseCaseException(IUseCase useCase, IActorInApp actor) : base($"Korisniku sa id-em {actor.Id} - {actor.Identifikator} pokusava da izvrsi {useCase.Opis} ")
        {
        }
    }
}
