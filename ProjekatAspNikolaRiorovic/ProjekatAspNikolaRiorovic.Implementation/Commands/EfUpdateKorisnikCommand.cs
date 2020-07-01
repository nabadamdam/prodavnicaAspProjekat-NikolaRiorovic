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
    public class EfUpdateKorisnikCommand : IUpdateKorisnikCommand
    {
        private readonly ProjekatAspNikolaRiorovicContext _context;
        private readonly UpdateKorisnikValidator _validator;
        private readonly UlogaIdValidator idValidator;
        private readonly EmailValidatorUnique emailValidator;

        public EfUpdateKorisnikCommand(ProjekatAspNikolaRiorovicContext context, UpdateKorisnikValidator validator, UlogaIdValidator idValidator, EmailValidatorUnique emailValidator)
        {
            _context = context;
            _validator = validator;
            this.idValidator = idValidator;
            this.emailValidator = emailValidator;
        }

        public int Id => 14;

        public string Opis => "Update korisnika koriscenjem Ef-a";

        public void Execute(UpdateKorisnikDto request)
        {
            if (_context.Korisnici.Any(x => x.Id == request.Id)) 
            {
                if (request.IdUloga != 17)
                {
                    var jedanKorisnik = _context.Korisnici.Find(request.Id);
                    idValidator.ValidateAndThrow(request);
                    _validator.ValidateAndThrow(request);
                    if (jedanKorisnik.Email == request.Email)
                    {
                        _validator.ValidateAndThrow(request);

                        jedanKorisnik.Ime = request.Ime;
                        jedanKorisnik.Prezime = request.Prezime;
                        jedanKorisnik.Email = request.Email;
                        jedanKorisnik.IdUloga = request.IdUloga;
                        jedanKorisnik.Password = MD5function.MD5Hash(request.Password);
                        _context.SaveChanges();
                    }
                    else
                    {
                        if (_context.Korisnici.Any(x => x.Email == request.Email))
                        {
                            emailValidator.ValidateAndThrow(request);
                        }
                        else
                        {
                            _validator.ValidateAndThrow(request);

                            jedanKorisnik.Ime = request.Ime;
                            jedanKorisnik.Prezime = request.Prezime;
                            jedanKorisnik.Email = request.Email;
                            jedanKorisnik.IdUloga = request.IdUloga;
                            jedanKorisnik.Password = MD5function.MD5Hash(request.Password);
                            _context.SaveChanges();
                        }
                    }
                }
                else
                {
                    throw new NotFoundException(request.IdUloga, typeof(Uloga));
                }
            }
            else
            {
                throw new NotFoundException(request.Id, typeof(Korisnik));
            }

        }
    }
}
