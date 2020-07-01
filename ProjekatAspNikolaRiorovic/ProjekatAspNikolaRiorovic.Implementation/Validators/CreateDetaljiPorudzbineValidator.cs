using FluentValidation;
using Microsoft.EntityFrameworkCore.Internal;
using ProjekatAspNikolaRiorovic.Application.DataTransfer;
using ProjekatAspNikolaRiorovic.EFDataAccess;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace ProjekatAspNikolaRiorovic.Implementation.Validators
{
    public class CreateDetaljiPorudzbineValidator : AbstractValidator<PravljenjeDetaljaPorudzbineDto>
    {
        private readonly ProjekatAspNikolaRiorovicContext context;
        public CreateDetaljiPorudzbineValidator(ProjekatAspNikolaRiorovicContext context)
        {
            this.context = context;
            RuleFor(x => x.IdProduct).Must(TrazenjeIda)
                .WithMessage("Proizvod sa ovim id-em ne postoji")
                .DependentRules(()=> 
                {
                    RuleFor(x => x.IdCenovnik)
                       .Must(TrazenjeIdaCenovnik)
                       .WithMessage("Id cenovnika za ovaj proizvod ne postoji");
                    RuleFor(x => x.Kolicina)
                        .GreaterThan(0)
                        .WithMessage("Kolicina mora biti veca od 0")
                        .Must(ProveraDaLiKolicinaZaProizvodPostojiUBazi)
                        .WithMessage("Kolicina koja je poslata za ovaj proizvod je nedostupna");

                });
        }
        private bool TrazenjeIda(int IdProduct)
        {
            return context.Proizvodi.Any(x => x.Id == IdProduct);
        }
        private bool TrazenjeIdaCenovnik(int IdCenovnik)
        {
            return context.Cenovnici.Any(x => x.Id == IdCenovnik);
        }
        private bool ProveraDaLiKolicinaZaProizvodPostojiUBazi(PravljenjeDetaljaPorudzbineDto dto,int Kolicina)
        {
            return context.Proizvodi.Find(dto.IdProduct).Kolicina >= dto.Kolicina;
        }
    }
}
