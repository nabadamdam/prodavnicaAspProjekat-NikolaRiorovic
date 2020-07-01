using Microsoft.EntityFrameworkCore;
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
    public class EfPromenaStatusa : IChangeStatusPorudzbineCommand
    {
        private readonly ProjekatAspNikolaRiorovicContext _context;

        public EfPromenaStatusa(ProjekatAspNikolaRiorovicContext context)
        {
            _context = context;
        }

        public int Id => 12;

        public string Opis => "Promena statusa porudzbine koriscenjem Ef-a";

        public void Execute(PromenaStatusaPorudzbineDto request)
        {
            if (_context.Porudzbine.Any(x => x.Id == request.IdPorudzbine))
            {
                var porudzbina = _context.Porudzbine
               .Include(p => p.DetaljiPorudzbina)
               .ThenInclude(pd => pd.Proizvod)
               .FirstOrDefault(x => x.Id == request.IdPorudzbine);
                if (porudzbina == null)
                {

                }
                if (porudzbina.StatusPorudzbine == StatusPorudzbine.primljena)
                {

                }
                if (porudzbina.StatusPorudzbine == StatusPorudzbine.primljena || porudzbina.StatusPorudzbine == StatusPorudzbine.isporucena)
                {
                    if (request.Status == StatusPorudzbine.otkazana || request.Status == StatusPorudzbine.isporucena)
                    {
                        porudzbina.StatusPorudzbine = request.Status;
                        if (request.Status == StatusPorudzbine.otkazana)
                        {
                            foreach (var n in porudzbina.DetaljiPorudzbina)
                            {
                                n.Proizvod.Kolicina += n.Kolicina;
                            }
                        }
                        _context.SaveChanges();

                    }
                }
            }
            else 
            {
                throw new NotFoundException(request.IdPorudzbine, typeof(Porudzbina));
            }
               
        }
    }
}
