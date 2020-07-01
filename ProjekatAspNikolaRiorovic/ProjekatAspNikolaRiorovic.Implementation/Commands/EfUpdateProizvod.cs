using FluentValidation;
using ProjekatAspNikolaRiorovic.Application.Commands;
using ProjekatAspNikolaRiorovic.Application.DataTransfer;
using ProjekatAspNikolaRiorovic.Application.Exceptions;
using ProjekatAspNikolaRiorovic.Domain.Entity;
using ProjekatAspNikolaRiorovic.EFDataAccess;
using ProjekatAspNikolaRiorovic.Implementation.Validators;
using ProjekatAspNikolaRiorovic.Implementation.Function;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ProjekatAspNikolaRiorovic.Implementation.Commands
{
    public class EfUpdateProizvod : IUpdateProizvodCommand
    {
        private readonly ProjekatAspNikolaRiorovicContext _context;
        private readonly UpdateProizvodValidator _validator;
        private readonly ProizvodNazivValidator _validatorNaziv;

        public EfUpdateProizvod(ProjekatAspNikolaRiorovicContext context, UpdateProizvodValidator validator, ProizvodNazivValidator validatorNaziv)
        {
            _context = context;
            _validator = validator;
            _validatorNaziv = validatorNaziv;
        }

        public int Id => 15;

        public string Opis => "Update Proizvod koriscenjem Ef-a";
        public void Execute(UpdateProizvodDto request)
        {
            
            if (_context.Proizvodi.Any(x => x.Id == request.Id))
            {
                var jedanProizvod = _context.Proizvodi.Find(request.Id);
                if (request.Naziv == jedanProizvod.Naziv)
                { 
                    _validator.ValidateAndThrow(request);
                    jedanProizvod.Naziv = request.Naziv;
                    jedanProizvod.Opis = request.Opis;
                    jedanProizvod.Slika = UploadJedneSlike.UploadJednaSlika(request.Slika);
                    jedanProizvod.Kolicina += request.Kolicina;
                    _context.SaveChanges();

                    var cena = new Cenovnik
                    {
                        IdProizvod = request.Id,
                        CenaProizvod = request.Cena
                    };
                    _context.Cenovnici.Add(cena);
                    _context.SaveChanges();
                }
                else
                {
                    _validatorNaziv.ValidateAndThrow(request);
                    _validator.ValidateAndThrow(request);
                    jedanProizvod.Naziv = request.Naziv;
                    jedanProizvod.Opis = request.Opis;
                    jedanProizvod.Slika = UploadJedneSlike.UploadJednaSlika(request.Slika);
                    jedanProizvod.Kolicina += request.Kolicina;
                    _context.SaveChanges();

                    var cena = new Cenovnik
                    {
                        IdProizvod = request.Id,
                        CenaProizvod = request.Cena
                    };
                    _context.Cenovnici.Add(cena);
                    _context.SaveChanges();
                }
            }
            else
            {
                throw new NotFoundException(request.Id, typeof(Proizvod));
            }
        }
        }
}
