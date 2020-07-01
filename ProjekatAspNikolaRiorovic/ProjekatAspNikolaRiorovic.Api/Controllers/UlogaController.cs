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
    public class UlogaController : ControllerBase
    {
        private readonly UseCaseExecutor executor;

        public UlogaController(UseCaseExecutor executor)
        {
            this.executor = executor;
        }

        // GET: api/Uloga
        [Authorize]
        [HttpGet]
        public IActionResult Get([FromQuery] UlogaSearch search, [FromServices] IGetUlogaQuery  query)
        {
            return Ok(executor.ExecuteRequest(query, search));
        }

        // GET: api/Uloga/5
        [Authorize]
        [HttpGet("{id}", Name = "DohvatanjeJedneUloge")]
        public IActionResult Get([FromRoute]int id, [FromServices] IGetOneUlogaQuery query)
        {
            return Ok(executor.ExecuteRequest(query, id));
        }

        // POST: api/Uloga
        [Authorize]
        [HttpPost]
        public void Post([FromBody] UlogaDto dto,[FromServices] ICreateUlogaCommand command)
        {
            executor.ApplayCommand(command, dto);
        }

        // PUT: api/Uloga
        [Authorize]
        [HttpPut]
        public void Put([FromForm] UpdateUlogaDto dto, [FromServices] IUpdateUlogaCommand command)
        {
            executor.ApplayCommand(command, dto);
        }
        // DELETE: api/ApiWithActions/5
        [Authorize]
        [HttpDelete("{id}")]
        public IActionResult Delete(int id, [FromServices] IDeleteUlogaCommand command)
        {
            executor.ApplayCommand(command, id);
            return NoContent();
        }
      
    }
}
