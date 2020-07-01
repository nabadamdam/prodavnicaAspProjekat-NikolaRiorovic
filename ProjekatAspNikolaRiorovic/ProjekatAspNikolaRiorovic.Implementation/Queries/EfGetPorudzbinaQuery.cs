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
    public class EfGetPorudzbinaQuery : IGetPorudzbinaQuery
    {
        private readonly ProjekatAspNikolaRiorovicContext _context;

        public EfGetPorudzbinaQuery(ProjekatAspNikolaRiorovicContext context)
        {
            _context = context;
        }

        public int Id => 25;

        public string Opis => "Pretraga porudzbina koriscenjem Ef-a";

        public PagedResponse<GetPorudzbinaDto> Execute(PorudzbinaSearch search)
        {
            var upit = _context.Porudzbine.Include(x => x.DetaljiPorudzbina).Include(y=>y.Korisnik).AsQueryable();
            DateTime dateTime = new DateTime();
            string datum = search.DatumPorudzbine.Date.ToString("yyyy-MM-dd");
            if (search.DatumPorudzbine != dateTime)
            {
                upit = upit.Where(x => x.DatumPorudzbine.Date.ToString()==datum);
            }
         
             var preskokBrojenja = search.PoStrani * (search.Strana - 1);
             var odgovor = new PagedResponse<GetPorudzbinaDto>
             {
                 TrenutnaStrana = search.Strana,
                 StavkePoStranici = search.PoStrani,
                 UkupniBrojStavki = upit.Count(),
                 Stavke = upit.Skip(preskokBrojenja).Take(search.PoStrani).Select(x => new GetPorudzbinaDto
                 {
                    Adresa = x.Adresa,
                    StatusPorudzbine = x.StatusPorudzbine,
                    NacinPlacanja = x.NacinPlacanja,
                    ImeKorisnika = x.Korisnik.Ime,
                    PrezimeKorisnka = x.Korisnik.Prezime,
                    Jmbg = x.Korisnik.Jmbg,
                    NazivProizvoda = x.DetaljiPorudzbina.Select(x => x.NazivProizvoda),
                    Kolicina = x.DetaljiPorudzbina.Select(x => x.Kolicina),
                    Cena = x.DetaljiPorudzbina.Select(x => x.Cena)

                 }).ToList()

             };
             return odgovor;
        }
    }
}
