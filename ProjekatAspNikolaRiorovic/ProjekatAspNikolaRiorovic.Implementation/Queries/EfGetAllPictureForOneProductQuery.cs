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
    public class EfGetAllPictureForOneProductQuery : IGetAllPicForOneProduct
    {
        private readonly ProjekatAspNikolaRiorovicContext _context;

        public EfGetAllPictureForOneProductQuery(ProjekatAspNikolaRiorovicContext context)
        {
            _context = context;
        }

        public int Id => 18;

        public string Opis => "Pretraga svih slika za jedan proizvod koriscenjem Ef-a";


        public IEnumerable<PicturesForProductDto> Execute(int search)
        {
            if (_context.Proizvodi.Any(x => x.Id == search))
            {
                var upit = _context.Slike.Where(x => x.IdProizvod == search);
                var slike = upit.Select(x => new PicturesForProductDto
                {
                    Id = x.Id,
                    PutanjaSlike = x.Putanja,
                    IdProizvod = x.IdProizvod
                });
                return slike;
            }
            else
            {
                throw new NotFoundException(search, typeof(Proizvod));
            }
        }
    }
}
