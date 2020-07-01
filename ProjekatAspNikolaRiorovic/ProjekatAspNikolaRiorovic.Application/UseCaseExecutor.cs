using Newtonsoft.Json;
using ProjekatAspNikolaRiorovic.Application.Exceptions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json.Serialization;

namespace ProjekatAspNikolaRiorovic.Application
{
    public class UseCaseExecutor
    {
        private readonly IActorInApp actor;
        private readonly IUseCaseLogger logger;

        public UseCaseExecutor(IActorInApp actor, IUseCaseLogger logger)
        {
            this.actor = actor;
            this.logger = logger;
        }
        public TResult ExecuteRequest<TSearch,TResult>(IQuery<TSearch,TResult> query,TSearch search)
        {
            logger.Log(query, actor,search);
            if (!actor.DozvoleZaKorisnika.Contains(query.Id))
            {
                throw new NotAutorizedUseCaseException(query, actor);
            }
            return query.Execute(search);
        }
        public void ApplayCommand<RequestData>(ICommand<RequestData> command, RequestData request)
        {
            logger.Log(command, actor,request);
             if (!actor.DozvoleZaKorisnika.Contains(command.Id))
             {
                 throw new NotAutorizedUseCaseException(command, actor);
             }
             else
             {
                 command.Execute(request);
             }

        }
    }
}
