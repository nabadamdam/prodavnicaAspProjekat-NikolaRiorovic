using ProjekatAspNikolaRiorovic.Application.Commands;
using ProjekatAspNikolaRiorovic.Application.DataTransfer;
using ProjekatAspNikolaRiorovic.Application.Exceptions;
using ProjekatAspNikolaRiorovic.Domain.Entity;
using ProjekatAspNikolaRiorovic.EFDataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ProjekatAspNikolaRiorovic.Implementation.Commands
{
    public class EfUpdateKategorija : IUpdateKategorijaCommand
    {
        private readonly ProjekatAspNikolaRiorovicContext _context;

        public EfUpdateKategorija(ProjekatAspNikolaRiorovicContext context)
        {
            _context = context;
        }

        public int Id => 13;

        public string Opis => "Update kategorija koriscenjem Ef-a";

        public void Execute(KategorijaWithIdDto request)
        {
            var jednaKategorija = _context.Kategorije.Find(request.Id);
            if (_context.Kategorije.Any(x => x.Id == request.Id))
            {
                if (request.Naziv == jednaKategorija.Naziv)
                {
                    var jednaKategorijaUpdate = _context.Kategorije.Find(request.Id);
                    jednaKategorijaUpdate.Naziv = request.Naziv;
                    _context.SaveChanges();
                }
                else
                {
                    if (_context.Kategorije.Any(x => x.Naziv == request.Naziv))
                    {
                        throw new ConflictException(request.Naziv, typeof(Kategorija));
                    }
                    else
                    {
                        if (request.Naziv == null)
                        {
                            throw new NotFoundException(request.Id, typeof(Kategorija));
                        }
                        else
                        {
                            var jednaKategorijaUpdate = _context.Kategorije.Find(request.Id);
                            jednaKategorijaUpdate.Naziv = request.Naziv;
                            _context.SaveChanges();
                        }
                           
                    }
                }
            }
            else
            {
                throw new NotFoundException(request.Id, typeof(Kategorija));
            }
        }
    }
}
