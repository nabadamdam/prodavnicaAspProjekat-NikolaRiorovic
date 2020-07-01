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
    public class EfGetOneProizvodQuery : IGetOneProizvodQuery
    {
        private readonly ProjekatAspNikolaRiorovicContext _context;

        public EfGetOneProizvodQuery(ProjekatAspNikolaRiorovicContext context)
        {
            _context = context;
        }

        public int Id => 23;

        public string Opis => "Pretraga jednog proizvoda koriscenjem Ef-a";

        public GetProizvodDto Execute(int search)
        {
            var upit = _context.Proizvodi.Include(x => x.Cenovnici).Include(x => x.Slike).AsQueryable();
            upit = upit.Where(x => x.Id == search);
            if (_context.Proizvodi.Any(x => x.Id == search))
            {
                var proizvod = upit.Select(x => new GetProizvodDto
                {
                    Naziv = x.Naziv,
                    Kolicina = x.Kolicina,
                    Slika = x.Slika,
                    Slike = x.Slike.Select(x => x.Putanja),
                    Opis = x.Opis,
                    Cena = x.Cenovnici.OrderByDescending(y => y.Id).Select(x => x.CenaProizvod).First(),
                    IdKat = x.IdKat
                }).First();
                return proizvod;
            }
            else
            {
                throw new NotFoundException(search, typeof(Proizvod));
            }
        }
    }
}
