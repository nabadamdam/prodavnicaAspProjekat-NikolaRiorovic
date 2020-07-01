using ProjekatAspNikolaRiorovic.Application.Commands;
using ProjekatAspNikolaRiorovic.Application.Exceptions;
using ProjekatAspNikolaRiorovic.Domain;
using ProjekatAspNikolaRiorovic.Domain.Entity;
using ProjekatAspNikolaRiorovic.EFDataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ProjekatAspNikolaRiorovic.Implementation.Commands
{
    public class EfDeleteKorisnik : IDeleteKorisnikCommand
    {
        private readonly ProjekatAspNikolaRiorovicContext _context;

        public EfDeleteKorisnik(ProjekatAspNikolaRiorovicContext context)
        {
            _context = context;
        }
        public int Id => 8;

        public string Opis => "Brisanje korisnika koriscenjem Ef-a";

        public void Execute(int request)
        {
            if (_context.Korisnici.Any(x => x.Id == request))
            {
                var jedanKorisnik = _context.Korisnici.Find(request);
                if (jedanKorisnik == null)
                {
                    throw new NotFoundException(request, typeof(Korisnik));
                }
                var upitUseCase = _context.KorisnikUseCases.Where(x => x.IdKorisnik == request).AsQueryable();
                foreach (var us in upitUseCase)
                {
                    _context.Remove(us);

                }
                _context.SaveChanges();
                var upitPorudzbina = _context.Porudzbine.Where(x => x.IdKorisnik == request).AsQueryable();
                foreach (var u in upitPorudzbina)
                {
                    if (u.StatusPorudzbine != StatusPorudzbine.isporucena || u.StatusPorudzbine != StatusPorudzbine.otkazana)
                    {
                        u.StatusPorudzbine = StatusPorudzbine.otkazana;

                    }
                }
                _context.SaveChanges();
                jedanKorisnik.IsDeleted = true;
                jedanKorisnik.DeletedAt = DateTime.Now;
                jedanKorisnik.IsActive = false;
                _context.SaveChanges();
            }
            else
            {
                throw new NotFoundException(request, typeof(Korisnik));
            }
               
           
        }
    }
}
