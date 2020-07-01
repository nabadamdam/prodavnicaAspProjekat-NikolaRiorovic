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
    public class EfGetAllKategorijeQuery : IGetKategorijaQuery
    {
        private readonly ProjekatAspNikolaRiorovicContext _context;

        public EfGetAllKategorijeQuery(ProjekatAspNikolaRiorovicContext context)
        {
            _context = context;
        }

        public int Id => 17;

        public string Opis => "Pretraga kategorija koriscenjem Ef-a";

        public PagedResponse<KategorijaWithIdDto> Execute(KategorijaSearch search)
        {
            var upit = _context.Kategorije.AsQueryable();
            if (!string.IsNullOrEmpty(search.Naziv) || !string.IsNullOrWhiteSpace(search.Naziv))
            {
                upit = upit.Where(x => x.Naziv.ToLower().Contains(search.Naziv.ToLower()));

            }
            var preskokBrojenja = search.PoStrani * (search.Strana - 1);
            var odgovor = new PagedResponse<KategorijaWithIdDto>
            {
                TrenutnaStrana = search.Strana,
                StavkePoStranici = search.PoStrani,
                UkupniBrojStavki = upit.Count(),
                Stavke = upit.Skip(preskokBrojenja).Take(search.PoStrani).Select(x => new KategorijaWithIdDto
                {
                    Id = x.Id,
                    Naziv = x.Naziv

                }).ToList()

            };
            return odgovor;
        }
    }
}
