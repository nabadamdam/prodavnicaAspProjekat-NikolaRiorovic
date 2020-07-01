using FluentValidation;
using ProjekatAspNikolaRiorovic.Application.DataTransfer;
using ProjekatAspNikolaRiorovic.EFDataAccess;
using System;
using System.Collections.Generic;
using System.Text;

namespace ProjekatAspNikolaRiorovic.Implementation.Validators
{
    public class UpdateProizvodValidator : AbstractValidator<UpdateProizvodDto>
    {
        public UpdateProizvodValidator(ProjekatAspNikolaRiorovicContext context)
        {

            RuleFor(y => y.Naziv)
                .NotEmpty()
                .WithMessage("Polje naziv ne sme da bude prazno!");
            RuleFor(y => y.Opis)
                .NotEmpty()
                .WithMessage("Polje opis ne sme da bude prazno!");
            RuleFor(y => y.Slika)
               .NotEmpty()
               .WithMessage("Polje slika ne sme da bude prazno!");
            RuleFor(y => y.Kolicina)
               .NotEmpty()
               .WithMessage("Polje kolicina ne sme da bude prazno!");
            RuleFor(y => y.Cena)
               .NotEmpty()
               .WithMessage("Polje cena ne sme da bude prazno!");
        }
    }
}
