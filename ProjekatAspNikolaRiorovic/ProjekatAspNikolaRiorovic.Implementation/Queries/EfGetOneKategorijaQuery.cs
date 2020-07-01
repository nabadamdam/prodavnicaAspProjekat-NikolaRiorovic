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
    public class EfGetOneKategorijaQuery : IGetOneKategorijaQuery
    {
        private readonly ProjekatAspNikolaRiorovicContext _context;

        public EfGetOneKategorijaQuery(ProjekatAspNikolaRiorovicContext context)
        {
            _context = context;
        }

        public int Id => 20;

        public string Opis => "Pretraga jedne kategorije koriscenjem Ef-a";

        public KategorijaWithIdDto Execute(int search)
        {
            var upit = _context.Kategorije.AsQueryable();
            upit = upit.Where(x => x.Id == search);
            if (_context.Kategorije.Any(x => x.Id == search))
            {
                var kategorija = upit.Select(x => new KategorijaWithIdDto
                {
                    Id = x.Id,
                    Naziv = x.Naziv
                }).First();
                return kategorija;
            }
            else
            {
                throw new NotFoundException(search, typeof(Kategorija));
            }
        }
    }
}
