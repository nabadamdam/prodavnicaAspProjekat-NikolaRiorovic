using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using Newtonsoft.Json;
using ProjekatAspNikolaRiorovic.EFDataAccess;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;

namespace ProjekatAspNikolaRiorovic.Api.Core
{
    public class JwtManager
    {
        private readonly ProjekatAspNikolaRiorovicContext _context;

        public JwtManager(ProjekatAspNikolaRiorovicContext context)
        {
            _context = context;
        }

        public string MakeToken(string email, string password)
        {
            var korisnik = _context.Korisnici.Include(u => u.KorisnikUseCases)
                .FirstOrDefault(x => x.Email == email && x.Password == password);

            if (korisnik == null)
            {
                return null;
            }

            var actor = new JwtActor
            {
                Id = korisnik.Id,
                DozvoleZaKorisnika = korisnik.KorisnikUseCases.Select(x => x.IdUseCase),
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
