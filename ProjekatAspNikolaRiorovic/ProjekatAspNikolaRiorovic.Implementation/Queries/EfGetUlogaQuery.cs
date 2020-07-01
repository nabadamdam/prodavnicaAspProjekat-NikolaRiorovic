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
    public class EfGetUlogaQuery : IGetUlogaQuery
    {
        private readonly ProjekatAspNikolaRiorovicContext _context;

        public EfGetUlogaQuery(ProjekatAspNikolaRiorovicContext context)
        {
            _context = context;
        }

        public int Id => 27;

        public string Opis => "Pretraga uloga koriscenjem Ef-a";

        public PagedResponse<UlogaWithIdDto> Execute(UlogaSearch search)
        {
            var upit = _context.Uloge.AsQueryable();
            if (!string.IsNullOrEmpty(search.Naziv) || !string.IsNullOrWhiteSpace(search.Naziv))
            {
                upit = upit.Where(x => x.Naziv.ToLower().Contains(search.Naziv.ToLower()));

            }
            var preskokBrojenja = search.PoStrani * (search.Strana - 1);
            var odgovor = new PagedResponse<UlogaWithIdDto>
            {
                TrenutnaStrana = search.Strana,
                StavkePoStranici = search.PoStrani,
                UkupniBrojStavki = upit.Count(),
                Stavke = upit.Skip(preskokBrojenja).Take(search.PoStrani).Select(x => new UlogaWithIdDto
                {
                   IdUloga = x.Id,
                   Naziv = x.Naziv

                }).ToList()

            };
            return odgovor;
        }
    }
}
