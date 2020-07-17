using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using NestoIspitAsp.DataAccess;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;

namespace NestoIspitAsp.Api.Core
{
    public class JwtManager
    {
        private readonly ChinookContext context;

        public JwtManager(ChinookContext context)
        {
            this.context = context;
        }
        public string MakeToken(string email, string ime)
        {
            var korisnik = context.Customer.Include(u => u.Invoice)
                .FirstOrDefault(x => x.Email == email && x.FirstName == ime);

            if (korisnik == null)
            {
                return null;
            }

            var actor = new JwtActor
            {
                Id = korisnik.CustomerId,
                ListaDozvoljenihUseCase = korisnik.Invoice.Select(x => x.InvoiceId),
                Identifikator = korisnik.Email
            };

            var issuer = "asp_api";
            var secretKey = "ThisIsMyVerySecretKey";
            var claims = new List<Claim> // Jti : "", 
            {
                new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString(), ClaimValueTypes.String, issuer),
                new Claim(JwtRegisteredClaimNames.Iss, "asp_api", ClaimValueTypes.String, issuer),
                new Claim(JwtRegisteredClaimNames.Iat, DateTimeOffset.UtcNow.ToUnixTimeSeconds().ToString(), ClaimValueTypes.Integer64, issuer),
                new Claim("IdKorisnik", actor.Id.ToString(), ClaimValueTypes.String, issuer),
                new Claim("ActorData", JsonConvert.SerializeObject(actor), ClaimValueTypes.String, issuer)
            };

            var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(secretKey));

            var credentials = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);

            var now = DateTime.UtcNow;
            var token = new JwtSecurityToken(
                issuer: issuer,
                audience: "Any",
                claims: claims,
                notBefore: now,
                expires: now.AddSeconds(30),
                signingCredentials: credentials);

            return new JwtSecurityTokenHandler().WriteToken(token);
        }
    }
}
