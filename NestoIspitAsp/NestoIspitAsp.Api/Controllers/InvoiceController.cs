using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using NestoIspitAsp.Application;
using NestoIspitAsp.Application.Queries;
using NestoIspitAsp.Application.Searches;

namespace NestoIspitAsp.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class InvoiceController : ControllerBase
    {
        private readonly UseCaseExecutor executor;

        public InvoiceController(UseCaseExecutor executor)
        {
            this.executor = executor;
        }

        // GET: api/Invoice
        [HttpGet]
        public IActionResult Get([FromBody] InvoiceSearch search,[FromServices] IGetInvoiceQuery query)
        {
            return Ok(executor.ExecuteRequest(query,search));
        }

        // GET: api/Invoice/5
        [HttpGet("{id}", Name = "Get1")]
        public string Get(int id)
        {
            return "value";
        }

        // POST: api/Invoice
        [HttpPost]
        public void Post([FromBody] string value)
        {
        }

        // PUT: api/Invoice/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE: api/ApiWithActions/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
