using System;
using System.Collections.Generic;
using System.Text;

namespace ProjekatAspNikolaRiorovic.Application
{
    public interface IUseCaseLogger
    {
        void Log(IUseCase useCase, IActorInApp actor,object useCaseData);
    }
}
