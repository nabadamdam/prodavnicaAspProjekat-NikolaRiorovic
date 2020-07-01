using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ProjekatAspNikolaRiorovic.Application;
using ProjekatAspNikolaRiorovic.Application.Queries;
using ProjekatAspNikolaRiorovic.Application.Searches;

namespace ProjekatAspNikolaRiorovic.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UseCaseController : ControllerBase
    {
        private readonly UseCaseExecutor executor;

        public UseCaseController(UseCaseExecutor executor)
        {
            this.executor = executor;
        }

        // GET: api/UseCase
        [Authorize]
        [HttpGet]
        public IActionResult Get([FromQuery] UseCaseSearch search, [FromServices] IGetUseCase query)
        {
            return Ok(executor.ExecuteRequest(query, search));
        }

    }
}
