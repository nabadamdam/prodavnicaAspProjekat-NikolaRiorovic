using ProjekatAspNikolaRiorovic.Application.Commands;
using ProjekatAspNikolaRiorovic.Application.DataTransfer;
using ProjekatAspNikolaRiorovic.Application.Exceptions;
using ProjekatAspNikolaRiorovic.Domain.Entity;
using ProjekatAspNikolaRiorovic.EFDataAccess;
using ProjekatAspNikolaRiorovic.Implementation.Validators;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ProjekatAspNikolaRiorovic.Implementation.Commands
{
    public class EfUpdateUloga : IUpdateUlogaCommand
    {
        private readonly ProjekatAspNikolaRiorovicContext _context;

        public EfUpdateUloga(ProjekatAspNikolaRiorovicContext context)
        {
            _context = context;
        }

        public int Id => 16;

        public string Opis => "Update uloga koriscenjem Ef-a";

        public void Execute(UpdateUlogaDto request)
        {
            var jednaUloga = _context.Uloge.Find(request.IdUloga);
            if (_context.Uloge.Any(x => x.Id == request.IdUloga))
            {
                if(request.NazivUloga == jednaUloga.Naziv) 
                {
                    var jednaUlogaUpdate = _context.Uloge.Find(request.IdUloga);
                    jednaUlogaUpdate.Naziv = request.NazivUloga;
                    _context.SaveChanges();
                }
                else
                {
                    if (_context.Uloge.Any(x => x.Naziv == request.NazivUloga))
                    {
                        throw new ConflictException(request.NazivUloga,typeof(Uloga));
                    }
                    else
                    {
                        if (request.NazivUloga==null)
                        {
                            throw new NotFoundException(request.IdUloga, typeof(Uloga));
                        }
                        else
                        {
                            var jednaUlogaUpdate = _context.Uloge.Find(request.IdUloga);
                            jednaUlogaUpdate.Naziv = request.NazivUloga;
                            _context.SaveChanges();
                        }
                     
                    }
                }
            }
            else
            {
                throw new NotFoundException(request.IdUloga,typeof(Uloga));
            }
        }
    }
}
