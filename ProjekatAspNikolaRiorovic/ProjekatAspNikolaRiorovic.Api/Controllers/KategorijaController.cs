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

namespace ProjekatAspNikolaRiorovic.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class KategorijaController : ControllerBase
    {
        private readonly UseCaseExecutor executor;

        public KategorijaController( UseCaseExecutor executor)
        {
            this.executor = executor;
        }

        // GET: api/Kategorija
        [Authorize]
        [HttpGet]
        public IActionResult Get([FromQuery] KategorijaSearch search, [FromServices] IGetKategorijaQuery query)
        {
            return Ok(executor.ExecuteRequest(query, search));
        }

        // GET: api/Kategorija/5
        [Authorize]
        [HttpGet("{id}", Name = "DohvatanjeJedneKategorije")]
        public IActionResult Get([FromRoute]int id, [FromServices] IGetOneKategorijaQuery query)
        {
            return Ok(executor.ExecuteRequest(query, id));
        }
        // POST: api/Kategorija
        [Authorize]
        [HttpPost]
        public void Post([FromBody] KategorijaDto dto,[FromServices] ICreateKategorijaCommand command)
        {
            executor.ApplayCommand(command, dto);
        }

        // PUT: api/Kategorija/5
        [Authorize]
        [HttpPut]
        public void Put([FromForm] KategorijaWithIdDto dto, [FromServices] IUpdateKategorijaCommand command)
        {
            executor.ApplayCommand(command, dto);
        }
        // DELETE: api/ApiWithActions/5
        [Authorize]
        [HttpDelete("{id}")]
        public IActionResult Delete(int id, [FromServices] IDeleteKategorijaCommand command)
        {
            executor.ApplayCommand(command, id);
            return NoContent();
        }
     
    }
}
