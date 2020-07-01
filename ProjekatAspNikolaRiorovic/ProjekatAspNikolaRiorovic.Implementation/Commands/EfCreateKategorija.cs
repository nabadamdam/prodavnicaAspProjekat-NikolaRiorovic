using AutoMapper;
using FluentValidation;
using ProjekatAspNikolaRiorovic.Application.Commands;
using ProjekatAspNikolaRiorovic.Application.DataTransfer;
using ProjekatAspNikolaRiorovic.Domain.Entity;
using ProjekatAspNikolaRiorovic.EFDataAccess;
using ProjekatAspNikolaRiorovic.Implementation.Validators;
using System;
using System.Collections.Generic;
using System.Text;

namespace ProjekatAspNikolaRiorovic.Implementation.Commands
{
    public class EfCreateKategorija : ICreateKategorijaCommand
    {
        private readonly ProjekatAspNikolaRiorovicContext _context;
        private readonly CreateKategorijaValidator validator;
        private readonly IMapper _mapper;
        public EfCreateKategorija(ProjekatAspNikolaRiorovicContext context, CreateKategorijaValidator validator, IMapper mapper)
        {
            _context = context;
            this.validator = validator;
            _mapper = mapper;
        }

        public int Id => 1;

        public string Opis => "Kreiranje nove kategorije koriscenjem Ef-a";

        public void Execute(KategorijaDto request)
        {
            validator.ValidateAndThrow(request);

            var kategorija = _mapper.Map<Kategorija>(request);
            _context.Kategorije.Add(kategorija);
            _context.SaveChanges();
        }
    }
}
