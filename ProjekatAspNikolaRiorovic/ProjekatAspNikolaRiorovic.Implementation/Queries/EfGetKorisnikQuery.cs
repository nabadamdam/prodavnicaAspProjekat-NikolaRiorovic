using Microsoft.EntityFrameworkCore;
using ProjekatAspNikolaRiorovic.Application.DataTransfer;
using ProjekatAspNikolaRiorovic.Application.Queries;
using ProjekatAspNikolaRiorovic.Application.Searches;
using ProjekatAspNikolaRiorovic.EFDataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ProjekatAspNikolaRiorovic.Implementation.Queries
{
    public class EfGetKorisnikQuery : IGetKorisnikQuery
    {
        private readonly ProjekatAspNikolaRiorovicContext _context;

        public EfGetKorisnikQuery(ProjekatAspNikolaRiorovicContext context)
        {
            _context = context;
        }

        public int Id => 19;

        public string Opis => "Pretraga korisnika koriscenjem Ef-a";

        public PagedResponse<GetKorisnikDto> Execute(KorisnikSearch search)
        {
            var upit = _context.Korisnici.Include(x => x.Uloga).AsQueryable();
            if (!string.IsNullOrEmpty(search.SearchZaKorisnike) || !string.IsNullOrWhiteSpace(search.SearchZaKorisnike))
            {
                upit = upit.Where(x => x.Ime.ToLower().Contains(search.SearchZaKorisnike.ToLower()) || x.Prezime.ToLower().Contains(search.SearchZaKorisnike.ToLower()));

            }
            var preskokBrojenja = search.PoStrani * (search.Strana - 1);
            var odgovor = new PagedResponse<GetKorisnikDto>
            {
                TrenutnaStrana = search.Strana,
                StavkePoStranici = search.PoStrani,
                UkupniBrojStavki = upit.Count(),
                Stavke = upit.Skip(preskokBrojenja).Take(search.PoStrani).Select(x => new GetKorisnikDto
                {
                    Id = x.Id,
                    Ime = x.Ime,
                    Prezime = x.Prezime,
                    Jmbg = x.Jmbg,
                    Email = x.Email,
                    NazivUloge = x.Uloga.Naziv 
                    
                }).ToList()

            };
            return odgovor;
        }
    }
}
