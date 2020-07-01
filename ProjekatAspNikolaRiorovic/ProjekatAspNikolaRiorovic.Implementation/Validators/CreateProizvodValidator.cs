using FluentValidation;
using ProjekatAspNikolaRiorovic.Application.DataTransfer;
using ProjekatAspNikolaRiorovic.EFDataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ProjekatAspNikolaRiorovic.Implementation.Validators
{
    public class CreateProizvodValidator : AbstractValidator<InsertProizvodDto>
    {
        public CreateProizvodValidator(ProjekatAspNikolaRiorovicContext context)
        {
            RuleFor(y => y.Naziv)
                .NotEmpty()
                .Must(naziv => !context.Proizvodi.Any(k => k.Naziv == naziv))
                .WithMessage("Polje naziv ne sme da bude prazno!");
            RuleFor(y => y.Opis)
                .NotEmpty()
                .WithMessage("Polje opis ne sme da bude prazno!");
            RuleForEach(y => y.Slike)
               .NotEmpty()
               .WithMessage("Polje slika ne sme da bude prazno!");
            RuleFor(y => y.Kolicina)
               .NotEmpty()
               .WithMessage("Polje kolicina ne sme da bude prazno!");
            RuleFor(y => y.IdKat)
              .NotEmpty()
              .WithMessage("Polje id kategorije ne sme da bude prazno!");
            RuleFor(y => y.Cena)
             .NotEmpty()
             .WithMessage("Polje cena ne sme da bude prazno!");
        }
    }
}
