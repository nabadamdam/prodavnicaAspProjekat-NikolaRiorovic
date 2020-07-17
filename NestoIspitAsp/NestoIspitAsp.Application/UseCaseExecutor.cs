using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace NestoIspitAsp.Application
{
    public class UseCaseExecutor
    {
        private readonly IActorApp actor;

        public UseCaseExecutor(IActorApp actor)
        {
            this.actor = actor;
        }

        public Result ExecuteRequest<Search,Result>(IQuery<Search,Result> query,Search search)
        {
            if (!actor.ListaDozvoljenihUseCase.Contains(query.Id))
            {
                throw new ArgumentException("Nemate dozvole da uradite ovo!");
            }
            return query.Execute(search);
        }
        public void ApplayCommand<RequestData>(ICommand<RequestData> command,RequestData request)
        {
            if (!actor.ListaDozvoljenihUseCase.Contains(command.Id))
            {
                throw new ArgumentException("Nemate dozvole da uradite ovo!");
            }
            command.Execute(request);
        }
    }
}
