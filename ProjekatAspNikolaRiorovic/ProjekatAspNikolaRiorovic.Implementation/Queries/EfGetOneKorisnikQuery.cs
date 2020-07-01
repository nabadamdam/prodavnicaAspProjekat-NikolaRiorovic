using Microsoft.EntityFrameworkCore;
using ProjekatAspNikolaRiorovic.Application.DataTransfer;
using ProjekatAspNikolaRiorovic.Application.Exceptions;
using ProjekatAspNikolaRiorovic.Application.Queries;
using ProjekatAspNikolaRiorovic.Domain.Entity;
using ProjekatAspNikolaRiorovic.EFDataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ProjekatAspNikolaRiorovic.Implementation.Queries
{
    public class EfGetOneKorisnikQuery : IGetOneKorisnikQuery
    {
        private readonly ProjekatAspNikolaRiorovicContext _context;

        public EfGetOneKorisnikQuery(ProjekatAspNikolaRiorovicContext context)
        {
            _context = context;
        }

        public int Id => 21;

        public string Opis => "Pretraga jednog korisnika koriscenjem Ef-a";

        public GetOneKorisnikDto Execute(int search)
        {
            var upit = _context.Korisnici.Include(x => x.Uloga).AsQueryable();
            upit = upit.Where(x => x.Id == search);
            if (_context.Korisnici.Any(x => x.Id == search))
            {
                var proizvod = upit.Select(x => new GetOneKorisnikDto
                {
                    Ime = x.Ime,
                    Prezime = x.Prezime,
                    Jmbg = x.Jmbg,
                    Email = x.Email,
                    UlogaNaziv = x.Uloga.Naziv
                }).First();
                return proizvod;
            }
            else
            {
                
                throw new NotFoundException(search, typeof(Korisnik));
            }
              
            
        }
    }
}
