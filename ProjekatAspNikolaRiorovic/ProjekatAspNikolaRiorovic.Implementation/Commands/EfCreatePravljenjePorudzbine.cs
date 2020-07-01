using FluentValidation;
using Microsoft.EntityFrameworkCore.Internal;
using ProjekatAspNikolaRiorovic.Application;
using ProjekatAspNikolaRiorovic.Application.Commands;
using ProjekatAspNikolaRiorovic.Application.DataTransfer;
using ProjekatAspNikolaRiorovic.Domain.Entity;
using ProjekatAspNikolaRiorovic.EFDataAccess;
using ProjekatAspNikolaRiorovic.Implementation.Validators;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ProjekatAspNikolaRiorovic.Implementation.Commands
{
    public class EfCreatePravljenjePorudzbine : ICreatePravljenjePorudzbineCommand
    {
        private readonly ProjekatAspNikolaRiorovicContext _context;
        private readonly CreatePravljenjePorudzbineValidator validator;
        private readonly IActorInApp actor;

        public EfCreatePravljenjePorudzbine(ProjekatAspNikolaRiorovicContext context, CreatePravljenjePorudzbineValidator validator, IActorInApp actor)
        {
            _context = context;
            this.validator = validator;
            this.actor = actor;
        }

        public int Id => 3;

        public string Opis => "Kreiranje nove porudzbine koriscenjem Ef-a";

        public void Execute(PravljenjePorudzbineDto request)
        {
            validator.ValidateAndThrow(request);
            int IdKorisnik = actor.Id;
            var porudzbina = new Porudzbina
            {
                IdKorisnik = IdKorisnik,
                Adresa = request.Adresa,
                DatumPorudzbine = request.DatumPorudzbine
            };
            foreach(var item in request.Stavke)
            {
                var proizvod = _context.Proizvodi.Find(item.IdProduct);
                var cena = _context.Cenovnici.Find(item.IdCenovnik);
                var CenaProizvod = cena.CenaProizvod;
                proizvod.Kolicina -= item.Kolicina;
                porudzbina.DetaljiPorudzbina.Add(new DetaljiPorudzbine
                {
                    NazivProizvoda = proizvod.Naziv,
                    Kolicina = item.Kolicina,
                    Cena = CenaProizvod,
                    IdProizvod = item.IdProduct,

                });;
            }
            _context.Porudzbine.Add(porudzbina);
            _context.SaveChanges();
        }
    }
}
