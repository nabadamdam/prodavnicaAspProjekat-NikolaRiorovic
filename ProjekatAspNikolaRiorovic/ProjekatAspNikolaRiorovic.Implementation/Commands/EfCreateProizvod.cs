using AutoMapper;
using FluentValidation;
using ProjekatAspNikolaRiorovic.Application.Commands;
using ProjekatAspNikolaRiorovic.Application.DataTransfer;
using ProjekatAspNikolaRiorovic.Domain.Entity;
using ProjekatAspNikolaRiorovic.EFDataAccess;
using ProjekatAspNikolaRiorovic.Implementation.Function;
using ProjekatAspNikolaRiorovic.Implementation.Validators;
using ProjekatAspNikolaRiorovic.Implementation.Function;
using System;
using System.Collections.Generic;
using System.Text;
using System.Linq;
using ProjekatAspNikolaRiorovic.Application.Exceptions;

namespace ProjekatAspNikolaRiorovic.Implementation.Commands
{
    public class EfCreateProizvod : ICreateProizvodCommand
    {
        private readonly ProjekatAspNikolaRiorovicContext _context;
        private readonly CreateProizvodValidator validator;
        private readonly IMapper _mapper;
        public EfCreateProizvod(ProjekatAspNikolaRiorovicContext context, CreateProizvodValidator validator, IMapper mapper)
        {
            this._context = context;
            this.validator = validator;
            _mapper = mapper;
        }

        public int Id =>4;

        public string Opis => "Kreiranje novog proizvoda koriscenjem Ef-a";

        public void Execute(InsertProizvodDto request)
        {
            if (_context.Kategorije.Any(x => x.Id == request.IdKat))
            {
                validator.ValidateAndThrow(request);
                string[] stringNiz = UploadSlike.Upload(request.Slike);
                var proizvod = new Proizvod
                {
                    Naziv = request.Naziv,
                    Kolicina = request.Kolicina,
                    Slika = stringNiz[0],
                    Opis = request.Opis,
                    IdKat = request.IdKat
                };
                _context.Proizvodi.Add(proizvod);
                _context.SaveChanges();


                var proizovdId = proizvod.Id;
                for (var i = 0; i < stringNiz.Count(); i++)
                {
                    if (stringNiz[i] != stringNiz[0])
                    {
                        var slika = new Slika
                        {
                            IdProizvod = proizovdId,
                            Putanja = stringNiz[i]
                        };
                        _context.Slike.Add(slika);
                        _context.SaveChanges();
                    }
                }
                var cena = new Cenovnik
                {
                    CenaProizvod = request.Cena,
                    IdProizvod = proizovdId
                };
                _context.Cenovnici.Add(cena);
                _context.SaveChanges();
            }
            else
            {
                throw new NotFoundException(request.IdKat, typeof(Kategorija));
            }
               
        }
    }
}
