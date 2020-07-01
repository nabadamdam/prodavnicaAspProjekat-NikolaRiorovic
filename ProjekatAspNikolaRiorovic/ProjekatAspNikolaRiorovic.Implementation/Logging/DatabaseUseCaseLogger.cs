using Newtonsoft.Json;
using ProjekatAspNikolaRiorovic.Application;
using ProjekatAspNikolaRiorovic.Domain.Entity;
using ProjekatAspNikolaRiorovic.EFDataAccess;
using System;
using System.Collections.Generic;
using System.Text;

namespace ProjekatAspNikolaRiorovic.Implementation.Logging
{
    public class DatabaseUseCaseLogger : IUseCaseLogger
    {
        private readonly ProjekatAspNikolaRiorovicContext context;

        public DatabaseUseCaseLogger(ProjekatAspNikolaRiorovicContext context)
        {
            this.context = context;
        }

        public void Log(IUseCase useCase, IActorInApp actor, object useCaseData)
        {
            context.UseCaseLogs.Add(new UseCaseLog 
            { 
                Actor = actor.Identifikator,
                Datum = DateTime.UtcNow,
                Podaci = JsonConvert.SerializeObject(useCaseData),
                NazivUseCase = useCase.Opis

            });
            context.SaveChanges();
        }
    }
}
