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
using ProjekatAspNikolaRiorovic.EFDataAccess;

namespace ProjekatAspNikolaRiorovic.Api.Controllers
{
    
    [Route("api/[controller]")]
    [ApiController]
    public class ProizvodController : ControllerBase
    {
        private readonly UseCaseExecutor executor;

        public ProizvodController( UseCaseExecutor executor)
        {
            this.executor = executor;
        }

        // GET: api/Proizvod
        [HttpGet]
        public IActionResult Get([FromQuery] ProizvodSearch search,[FromServices] IGetProizvodQuery query)
        {
            return Ok(executor.ExecuteRequest(query, search));
        }

        // GET: api/Proizvod/5
        [HttpGet("{id}", Name = "DohvatanjeJednogProizvoda")]
        public IActionResult Get([FromRoute]int id, [FromServices] IGetOneProizvodQuery query)
        {
            return Ok(executor.ExecuteRequest(query, id));
        }

        // POST: api/Proizvod
        [Authorize]
        [HttpPost]
       
        public void Post([FromForm] InsertProizvodDto dto,[FromServices] ICreateProizvodCommand command)
        {
            executor.ApplayCommand(command, dto);
        }

        // PUT: api/Proizvod
        [Authorize]
        [HttpPut]
        public void Put([FromForm] UpdateProizvodDto dto, [FromServices] IUpdateProizvodCommand command)
        {
            executor.ApplayCommand(command, dto);
        }
        // DELETE: api/ApiWithActions/5
        [Authorize]
        [HttpDelete("{id}")]
        public IActionResult Delete(int id, [FromServices] IDeleteProizvodCommand command)
        {
            executor.ApplayCommand(command, id);
            return NoContent();
        }
    }
}
