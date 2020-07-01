using ProjekatAspNikolaRiorovic.Application.Commands;
using ProjekatAspNikolaRiorovic.Application.DataTransfer;
using ProjekatAspNikolaRiorovic.EFDataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ProjekatAspNikolaRiorovic.Implementation.Commands
{
    public class EfDeletePicturesForProduct : IDeletePictureProductCommand
    {
        private readonly ProjekatAspNikolaRiorovicContext _context;

        public EfDeletePicturesForProduct(ProjekatAspNikolaRiorovicContext context)
        {
            _context = context;
        }

        public int Id => 9;

        public string Opis => "Brisanje slika za odredjeni proizvod koriscenjem Ef-a";

        public void Execute(IEnumerable<PicturesForProductDto> request)
        {
            var upit = _context.Slike;

            foreach(var r in request)
            {
                var jednaSlika = upit.Find(r.Id);
                jednaSlika.IsActive = false;
                jednaSlika.IsDeleted = true;
                jednaSlika.DeletedAt = DateTime.Now;
            }
            _context.SaveChanges();
        }
    }
}
