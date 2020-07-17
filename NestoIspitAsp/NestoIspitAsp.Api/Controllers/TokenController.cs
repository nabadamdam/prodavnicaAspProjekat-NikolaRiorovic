﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using NestoIspitAsp.Api.Core;

namespace NestoIspitAsp.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TokenController : ControllerBase
    {
        private readonly JwtManager manager;

        public TokenController(JwtManager manager)
        {
            this.manager = manager;
        }

        // POST: api/Token
        [HttpPost]
        public IActionResult Post([FromBody] LoginRequest request)
        {
            var token = manager.MakeToken(request.Email, request.Ime);
            if(token == null)
            {
                return Unauthorized();
            }
            return Ok(new { token });
        }
        public class LoginRequest
        {
            public string Email { get; set; }
            public string Ime { get; set; }
        }
    }
}
