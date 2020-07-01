using AutoMapper;
using FluentValidation;
using ProjekatAspNikolaRiorovic.Application.Commands;
using ProjekatAspNikolaRiorovic.Application.DataTransfer;
using ProjekatAspNikolaRiorovic.Application.Email;
using ProjekatAspNikolaRiorovic.Domain;
using ProjekatAspNikolaRiorovic.Domain.Entity;
using ProjekatAspNikolaRiorovic.EFDataAccess;
using ProjekatAspNikolaRiorovic.Implementation.Validators;
using ProjekatAspNikolaRiorovic.Implementation.Function;
using System;
using System.Collections.Generic;
using System.Security.Cryptography;
using System.Text;

namespace ProjekatAspNikolaRiorovic.Implementation.Commands
{
    public class EfCreateKorisnik : ICreateKorisnikCommand
    {
        private readonly ProjekatAspNikolaRiorovicContext _context;
        private readonly CreateKorisnikValidator validator;
        private readonly IMapper _mapper;
        private readonly IEmailSender sender;
        public EfCreateKorisnik(ProjekatAspNikolaRiorovicContext context, CreateKorisnikValidator validator, IMapper mapper, IEmailSender sender)
        {
            this._context = context;
            this.validator = validator;
            _mapper = mapper;
            this.sender = sender;
        }

        public int Id => 2;

        public string Opis => "Kreiranje novog korisnika koriscenjem Ef-a";

        public void Execute(KorisnikDto request)
        {
            validator.ValidateAndThrow(request);
            
            var korisnik = new Korisnik 
            {
                Ime = request.Ime,
                Prezime = request.Prezime,
                Jmbg = request.Jmbg,
                Email = request.Email,
                Password = MD5function.MD5Hash(request.Password),
                IdUloga = 18

            
            };
            _context.Korisnici.Add(korisnik);
            _context.SaveChanges();
            var idUnetogKorisnika = korisnik.Id;
            var korisnikuseCase1 = new KorisnikUseCase
            {
                IdKorisnik = idUnetogKorisnika,
                IdUseCase = 3
            };
            _context.KorisnikUseCases.Add(korisnikuseCase1);
            _context.SaveChanges();
            var korisnikuseCase2 = new KorisnikUseCase
            {
                IdKorisnik = idUnetogKorisnika,
                IdUseCase = 23
            };
            _context.KorisnikUseCases.Add(korisnikuseCase2);
            _context.SaveChanges();
            var korisnikuseCase3 = new KorisnikUseCase
            {
                IdKorisnik = idUnetogKorisnika,
                IdUseCase = 26
            };
            _context.KorisnikUseCases.Add(korisnikuseCase3);
            _context.SaveChanges();
            sender.Send(new EmailDto
            {
                Sadrzaj = "<h1>Uspesna registracija</h1>",
                PosaljiNaEmail = request.Email,
                Naslov = "Registracija"

            }); ;
        }
    }
}
