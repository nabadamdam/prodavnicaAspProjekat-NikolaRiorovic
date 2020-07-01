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
    public class EfGetUseCase : IGetUseCase
    {
        private readonly ProjekatAspNikolaRiorovicContext _context;

        public EfGetUseCase(ProjekatAspNikolaRiorovicContext context)
        {
            _context = context;
        }

        public int Id => 28;

        public string Opis => "Pretraga usecase koriscenjem Ef-a";

        public PagedResponse<UseCaseDto> Execute(UseCaseSearch search)
        {
            var upit = _context.UseCaseLogs.AsQueryable();
            if (!string.IsNullOrEmpty(search.Naziv) || !string.IsNullOrWhiteSpace(search.Naziv))
            {
                upit = upit.Where(x => x.NazivUseCase.ToLower().Contains(search.Naziv.ToLower()));

            }
            string nestoDo = search.DatumDo.Date.ToString("yyyy-MM-dd");
            DateTime dateTime = new DateTime();
            if (search.DatumOd != dateTime)
            {
                if (search.DatumDo != dateTime)
                {
                    if(search.DatumOd == search.DatumDo)
                    {
                        upit = upit.Where(x => x.Datum.Date == search.DatumOd);
                    }
                    else
                    {
                        upit = upit.Where(x => x.Datum >= search.DatumOd && x.Datum <= search.DatumDo);
                    }
                  
                }
                else
                {
                    upit = upit.Where(x => x.Datum.Date >= search.DatumOd.Date);
                }
            }
            else
            {
                if (search.DatumDo != dateTime)
                {
                    upit = upit.Where(x => x.Datum.Date <= search.DatumDo.Date);
                }
            }
            if (!string.IsNullOrEmpty(search.Email) || !string.IsNullOrWhiteSpace(search.Email))
            {
                if (search.NotAutorizedActor != false)
                {
                    upit = upit.Where(x => x.Actor.ToLower().Contains(search.Email.ToLower()));
                }
                else
                {
                    upit = upit.Where(x => x.Actor.ToLower().Contains(search.Email.ToLower()));
                }
            }
            else
            {
                if (search.NotAutorizedActor != false)
                {
                    upit = upit.Where(x => x.Actor == "Not authorized actor");
                }
            }
            var preskokBrojenja = search.PoStrani * (search.Strana - 1);
            var odgovor = new PagedResponse<UseCaseDto>
            {
                TrenutnaStrana = search.Strana,
                StavkePoStranici = search.PoStrani,
                UkupniBrojStavki = upit.Count(),
                Stavke = upit.Skip(preskokBrojenja).Take(search.PoStrani).Select(x => new UseCaseDto
                {
                    NazivUseCase = x.NazivUseCase,
                    Datum = x.Datum,
                    Podaci = x.Podaci,
                    Actor = x.Actor
                }).ToList()

            };
            return odgovor;
        }
    }
}
