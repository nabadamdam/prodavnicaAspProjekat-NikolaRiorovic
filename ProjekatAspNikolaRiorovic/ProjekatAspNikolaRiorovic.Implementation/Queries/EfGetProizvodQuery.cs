using AutoMapper;
using Microsoft.EntityFrameworkCore;
using ProjekatAspNikolaRiorovic.Application.DataTransfer;
using ProjekatAspNikolaRiorovic.Application.Exceptions;
using ProjekatAspNikolaRiorovic.Application.Queries;
using ProjekatAspNikolaRiorovic.Application.Searches;
using ProjekatAspNikolaRiorovic.Domain.Entity;
using ProjekatAspNikolaRiorovic.EFDataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Xml.Linq;

namespace ProjekatAspNikolaRiorovic.Implementation.Queries
{
    public class EfGetProizvodQuery : IGetProizvodQuery
    {
        private readonly ProjekatAspNikolaRiorovicContext _context;

        public EfGetProizvodQuery(ProjekatAspNikolaRiorovicContext context)
        {
            _context = context;
        }

        public int Id => 26;

        public string Opis => "Pretraga proizvoda koriscenjem Ef-a";

        public PagedResponse<GetProizvodDto> Execute(ProizvodSearch search)
        {
          
            var upit = _context.Proizvodi.Include(x => x.Cenovnici).Include(x => x.Slike).AsQueryable();
            if (!string.IsNullOrEmpty(search.Naziv) || !string.IsNullOrWhiteSpace(search.Naziv))
            {
                upit = upit.Where(x => x.Naziv.ToLower().Contains(search.Naziv.ToLower()));

            }
            if (search.IdKat != 0)
            {

                if (_context.Kategorije.Any(x => x.Id == search.IdKat))
                {
                    upit = upit.Where(x => x.IdKat == search.IdKat);
                }
                else
                {
                    throw new NotFoundException(search.IdKat, typeof(Kategorija));
                }
                            
            }
            var preskokBrojenja = search.PoStrani * (search.Strana - 1);
            var odgovor = new PagedResponse<GetProizvodDto>
            {
                TrenutnaStrana = search.Strana,
                StavkePoStranici = search.PoStrani,
                UkupniBrojStavki = upit.Count(),
                Stavke = upit.Skip(preskokBrojenja).Take(search.PoStrani).Select(x => new GetProizvodDto
                {
                    Naziv = x.Naziv,
                    Kolicina = x.Kolicina,
                    Slika = x.Slika,
                    Slike = x.Slike.Select(x => x.Putanja),
                    Opis = x.Opis,
                    Cena = x.Cenovnici.OrderByDescending(y => y.Id).Select(x => x.CenaProizvod).First(),
                    IdKat = x.IdKat
                }).ToList()

            };
            return odgovor;
          
            
            
             
        }
    }
}
