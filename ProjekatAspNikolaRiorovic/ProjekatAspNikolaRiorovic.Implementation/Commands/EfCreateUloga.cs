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
    public class EfCreateUloga : ICreateUlogaCommand
    {
        private readonly ProjekatAspNikolaRiorovicContext _context;
        private readonly CreateUlogaValidator validator;
        private readonly IMapper _mapper;

        public EfCreateUloga(ProjekatAspNikolaRiorovicContext context, CreateUlogaValidator validator, IMapper mapper)
        {
            _context = context;
            this.validator = validator;
            _mapper = mapper;
        }

        public int Id => 6;

        public string Opis => "Kreiranje nove uloge koriscenjem Ef-a";

        public void Execute(UlogaDto request)
        {
            validator.ValidateAndThrow(request);

            var uloga = _mapper.Map<Uloga>(request);

            _context.Uloge.Add(uloga);
            _context.SaveChanges();
        }
    }
}
