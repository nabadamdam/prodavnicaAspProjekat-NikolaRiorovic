using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ProjekatAspNikolaRiorovic.Application;
using ProjekatAspNikolaRiorovic.Application.Commands;
using ProjekatAspNikolaRiorovic.Application.DataTransfer;
using ProjekatAspNikolaRiorovic.Application.Exceptions;
using ProjekatAspNikolaRiorovic.Application.Queries;
using ProjekatAspNikolaRiorovic.Application.Searches;

namespace ProjekatAspNikolaRiorovic.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class KorisnikController : ControllerBase
    {
        private readonly IActorInApp actor;
        private readonly UseCaseExecutor executor;

        public KorisnikController(IActorInApp actor, UseCaseExecutor executor)
        {
            this.executor = executor;
            this.actor = actor;
        }

        // GET: api/Korisnik
        [Authorize]
        [HttpGet]
        public IActionResult Get([FromQuery] KorisnikSearch search, [FromServices] IGetKorisnikQuery query)
        {
            return Ok(executor.ExecuteRequest(query, search));
        }

        // GET: api/Korisnik/5
        [Authorize]
        [HttpGet("{id}", Name = "DohvatanjeJednogKorisnika")]
        public IActionResult Get([FromRoute]int id,[FromServices] IGetOneKorisnikQuery query)
        {
            return Ok(executor.ExecuteRequest(query, id));
        }

        // POST: api/Korisnik
        [HttpPost]
        public void Post([FromBody] KorisnikDto dto,[FromServices] ICreateKorisnikCommand command)
        {
            executor.ApplayCommand(command,dto);
            Response.StatusCode = 201;
        }

        // PUT: api/Korisnik
        [Authorize]
        [HttpPut]
        public void Put([FromForm] UpdateKorisnikDto dto, [FromServices] IUpdateKorisnikCommand command)
        {
            executor.ApplayCommand(command, dto);
        }

        // DELETE: api/ApiWithActions/5
        [Authorize]
        [HttpDelete("{id}")]
        public IActionResult Delete(int id, [FromServices] IDeleteKorisnikCommand command) 
        {
            executor.ApplayCommand(command, id);
            return NoContent();
        }
    }
}
