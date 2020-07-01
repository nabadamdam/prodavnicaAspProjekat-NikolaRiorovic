using AutoMapper;
using FluentValidation;
using ProjekatAspNikolaRiorovic.Application.Commands;
using ProjekatAspNikolaRiorovic.Application.DataTransfer;
using ProjekatAspNikolaRiorovic.Application.Exceptions;
using ProjekatAspNikolaRiorovic.Domain.Entity;
using ProjekatAspNikolaRiorovic.EFDataAccess;
using ProjekatAspNikolaRiorovic.Implementation.Function;
using ProjekatAspNikolaRiorovic.Implementation.Validators;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ProjekatAspNikolaRiorovic.Implementation.Commands
{
    public class EfCreateSlika : ICreateSlikaCommand
    {
        private readonly ProjekatAspNikolaRiorovicContext _context;
        private readonly CreateSlikaValidator validator;
        public EfCreateSlika(ProjekatAspNikolaRiorovicContext context, CreateSlikaValidator validator)
        {
            _context = context;
            this.validator = validator;
        }

        public int Id => 5;

        public string Opis => "Kreiranje nove slike proizvoda koriscenjem Ef-a";

        public void Execute(SlikaDto request)
        {
            if (_context.Proizvodi.Any(x => x.Id == request.IdProizvod))
            {
                validator.ValidateAndThrow(request);
                var novePutanje = UploadSlike.Upload(request.Putanje);
                for (int i = 0; i < novePutanje.Count(); i++)
                {
                    var slikaZaProizvod = new Slika
                    {
                        Putanja = novePutanje[i],
                        IdProizvod = request.IdProizvod
                    };
                    _context.Slike.Add(slikaZaProizvod);
                }
                _context.SaveChanges();
            }
            else
            {
                throw new NotFoundException(request.IdProizvod, typeof(Proizvod));
            }
        }
    }
}
