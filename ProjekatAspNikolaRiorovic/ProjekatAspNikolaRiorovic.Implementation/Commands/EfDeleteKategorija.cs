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
    public class EfDeleteKategorija : IDeleteKategorijaCommand
    {
        private readonly ProjekatAspNikolaRiorovicContext _context;

        public EfDeleteKategorija(ProjekatAspNikolaRiorovicContext context)
        {
            _context = context;
        }

        public int Id => 7;

        public string Opis => "Brisanje kategorije koriscenjem Ef-a";

        public void Execute(int request)
        {
            if (_context.Kategorije.Any(x => x.Id == request))
            {
                var jednaKategorija = _context.Kategorije.Find(request);
                var proizvodi = _context.Proizvodi.Where(x => x.IdKat == request);
                foreach (var p in proizvodi)
                {
                    p.IsDeleted = true;
                    p.DeletedAt = DateTime.Now;
                    p.IsActive = false;
                }
                _context.SaveChanges();
                jednaKategorija.IsDeleted = true;
                jednaKategorija.DeletedAt = DateTime.Now;
                jednaKategorija.IsActive = false;
                _context.SaveChanges();
            }
            else
            {
                throw new NotFoundException(request, typeof(Kategorija));
            }
        }
    }
}
