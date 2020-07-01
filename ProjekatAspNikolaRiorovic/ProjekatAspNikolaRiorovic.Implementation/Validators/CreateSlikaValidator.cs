using FluentValidation;
using ProjekatAspNikolaRiorovic.Application.DataTransfer;
using ProjekatAspNikolaRiorovic.EFDataAccess;
using System;
using System.Collections.Generic;
using System.Text;

namespace ProjekatAspNikolaRiorovic.Implementation.Validators
{
    public class CreateSlikaValidator : AbstractValidator<SlikaDto>
    {
        public CreateSlikaValidator(ProjekatAspNikolaRiorovicContext context)
        {
            RuleForEach(y => y.Putanje)
               .NotEmpty()
               .WithMessage("Polje putanja ne sme da bude prazno!");
            RuleFor(y => y.IdProizvod)
               .NotEmpty()
               .WithMessage("Polje id proizvoda ne sme da bude prazno!");
        }
    }
}
