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
using ProjekatAspNikolaRiorovic.Application.Queries;
using ProjekatAspNikolaRiorovic.Application.Searches;
using ProjekatAspNikolaRiorovic.Domain.Entity;

namespace ProjekatAspNikolaRiorovic.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PorudzbinaController : ControllerBase
    {

        private readonly UseCaseExecutor executor;

        public PorudzbinaController(UseCaseExecutor executor)
        {
            this.executor = executor;
        }

        // GET: api/Porudzbina
        [Authorize]
        [HttpGet]
        public IActionResult Get([FromQuery] PorudzbinaSearch search, [FromServices] IGetPorudzbinaQuery query)
        {
            return Ok(executor.ExecuteRequest(query, search));
        }

        // GET: api/Porudzbina/5
        [Authorize]
        [HttpGet("{id}", Name = "DohvatanjeJednePorudzbine")]
        public IActionResult Get([FromRoute]int id, [FromServices] IGetOnePorudzbinaQuery query)
        {
            return Ok(executor.ExecuteRequest(query, id));
        }
        // POST: api/Porudzbina
        [Authorize]
        [HttpPost]
        public void Post([FromBody] PravljenjePorudzbineDto dto , [FromServices] ICreatePravljenjePorudzbineCommand command)
        {
            executor.ApplayCommand(command, dto);
        }

        [Authorize]
        [HttpPost("promenastatusa")]
        public void PromenaStatusa([FromBody] PromenaStatusaPorudzbineDto dto, [FromServices]IChangeStatusPorudzbineCommand command)
        {
            executor.ApplayCommand(command, dto);
        }
    }
}
