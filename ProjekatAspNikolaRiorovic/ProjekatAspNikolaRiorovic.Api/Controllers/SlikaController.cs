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

namespace ProjekatAspNikolaRiorovic.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SlikaController : ControllerBase
    {
        private readonly UseCaseExecutor executor;

        public SlikaController(UseCaseExecutor executor)
        {
            this.executor = executor;
        }

        // GET: api/Slika/5
        [Authorize]
        [HttpGet("{id}", Name = "DohvatanjeJedneSlike")]
        public IActionResult Get(int id, [FromServices] IGetAllPicForOneProduct query)
        {
            return Ok(executor.ExecuteRequest(query, id));
        }

        // POST: api/Slika
        [Authorize]
        [HttpPost]
        public void Post([FromForm] SlikaDto dto,[FromServices] ICreateSlikaCommand command)
        {
            executor.ApplayCommand(command, dto);
        }

        // DELETE: api/ApiWithActions/5
        [Authorize]
        [HttpDelete]
        public void Delete([FromBody] IEnumerable<PicturesForProductDto> dto, [FromServices] IDeletePictureProductCommand command)
        {
            executor.ApplayCommand(command, dto);
        }
      
    }
}
