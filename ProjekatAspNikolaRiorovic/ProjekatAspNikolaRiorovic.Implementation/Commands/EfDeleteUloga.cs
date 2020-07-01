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
    public class EfDeleteUloga : IDeleteUlogaCommand
    {

        private readonly ProjekatAspNikolaRiorovicContext _context;

        public EfDeleteUloga(ProjekatAspNikolaRiorovicContext context)
        {
            _context = context;
        }

        public int Id => 11;

        public string Opis => "Brisanje uloge koriscenjem Ef-a";

        public void Execute(int request)
        {
            if (_context.Uloge.Any(x => x.Id == request))
            {
                var jednaUloga = _context.Uloge.Find(request);
                var korisnici = _context.Korisnici.Where(x => x.IdUloga == request);
                foreach (var k in korisnici)
                {
                    k.IsDeleted = true;
                    k.DeletedAt = DateTime.Now;
                }
                _context.SaveChanges();
                jednaUloga.IsDeleted = true;
                jednaUloga.DeletedAt = DateTime.Now;
                _context.SaveChanges();
            }
            else
            {
                throw new NotFoundException(request, typeof(Uloga));
            }
              
            
        }
    }
}
