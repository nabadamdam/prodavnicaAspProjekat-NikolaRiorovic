using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using NestoIspitAsp.Application;
using NestoIspitAsp.Application.Commands;

namespace NestoIspitAsp.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PlayListController : ControllerBase
    {
        private readonly UseCaseExecutor executor;

        public PlayListController(UseCaseExecutor executor)
        {
            this.executor = executor;
        }

        // GET: api/PlayList
        [HttpGet]
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET: api/PlayList/5
        [HttpGet("{id}", Name = "Get5")]
        public string Get(int id)
        {
            return "value";
        }

        // POST: api/PlayList
        [HttpPost]
        public void Post([FromBody] string value)
        {
        }

        // PUT: api/PlayList/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE: api/ApiWithActions/5
        [HttpDelete("{id}")]
        public void Delete(int id,[FromServices] IDeletePlaylistCommand command)
        {
            executor.ApplayCommand(command, id);
        }
    }
}
