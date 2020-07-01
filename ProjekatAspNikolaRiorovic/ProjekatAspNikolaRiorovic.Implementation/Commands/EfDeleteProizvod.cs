using ProjekatAspNikolaRiorovic.Application.Commands;
using ProjekatAspNikolaRiorovic.Application.Exceptions;
using ProjekatAspNikolaRiorovic.Domain.Entity;
using ProjekatAspNikolaRiorovic.EFDataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ProjekatAspNikolaRiorovic.Implementation.Commands
{
    public class EfDeleteProizvod : IDeleteProizvodCommand
    {
        private readonly ProjekatAspNikolaRiorovicContext _context;

        public EfDeleteProizvod(ProjekatAspNikolaRiorovicContext context)
        {
            _context = context;
        }

        public int Id => 10;

        public string Opis => "Brisanje proizvoda koriscenjem Ef-a";

        public void Execute(int request)
        {
            if (_context.Proizvodi.Any(x => x.Id == request))
            {
                var jedanProizvod = _context.Proizvodi.Find(request);
                if (jedanProizvod == null)
                {
                    throw new NotFoundException(request, typeof(Proizvod));
                }
                var upitCena = _context.Cenovnici.Where(x => x.IdProizvod == request).AsQueryable();
                var upitSlike = _context.Slike.Where(x => x.IdProizvod == request).AsQueryable();
                foreach (var uc in upitCena)
                {
                    uc.IsDeleted = true;
                    uc.IsActive = false;
                    uc.DeletedAt = DateTime.Now;

                }
                _context.SaveChanges();
                foreach (var us in upitSlike)
                {
                    us.IsDeleted = true;
                    us.IsActive = false;
                    us.DeletedAt = DateTime.Now;

                }
                _context.SaveChanges();


                jedanProizvod.IsDeleted = true;
                jedanProizvod.DeletedAt = DateTime.Now;
                jedanProizvod.IsActive = false;
                _context.SaveChanges();
            }
            else
            {
                throw new NotFoundException(request, typeof(Proizvod));
            }
        }
    }
}
