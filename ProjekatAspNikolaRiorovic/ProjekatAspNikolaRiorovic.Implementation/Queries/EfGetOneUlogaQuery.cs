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
    public class EfGetOneUlogaQuery : IGetOneUlogaQuery
    {
        private readonly ProjekatAspNikolaRiorovicContext _context;


        public EfGetOneUlogaQuery(ProjekatAspNikolaRiorovicContext context)
        {
            _context = context;
        }

        public int Id => 24;

        public string Opis => "Pretraga jedne uloge koriscenjem Ef-a";

        public UlogaWithIdDto Execute(int search)
        {
            var upit = _context.Uloge.AsQueryable();
            upit = upit.Where(x => x.Id == search);
            if(_context.Uloge.Any(x=>x.Id == search))
            {
                var uloga = upit.Select(x => new UlogaWithIdDto
                {
                    IdUloga = x.Id,
                    Naziv = x.Naziv
                }).First();
                return uloga;
            }
            else
            {
                throw new NotFoundException(search, typeof(Uloga));
            }
           
        }
    }
}
