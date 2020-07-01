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
    public class EfGetOnePorudzbinaQuery : IGetOnePorudzbinaQuery
    {
        private readonly ProjekatAspNikolaRiorovicContext _context;

        public EfGetOnePorudzbinaQuery(ProjekatAspNikolaRiorovicContext context)
        {
            _context = context;
        }

        public int Id => 22;

        public string Opis => "Pretraga jedne porudzbine koriscenjem Ef-a";

        public GetPorudzbinaDto Execute(int search)
        {
            var upit = _context.Porudzbine.Include(x => x.DetaljiPorudzbina).Include(y => y.Korisnik).AsQueryable().IgnoreQueryFilters();
            upit = upit.Where(x => x.Id == search);
            if (_context.Porudzbine.Any(x => x.Id == search)) 
            {
                var porudzbina = upit.Select(x => new GetPorudzbinaDto
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
                }).First();
                return porudzbina;
            }
            else
            {
                throw new NotFoundException(search, typeof(Porudzbina));
            }
        }
    }
}
