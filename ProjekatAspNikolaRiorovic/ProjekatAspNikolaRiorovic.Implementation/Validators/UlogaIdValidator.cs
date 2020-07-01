using FluentValidation;
using ProjekatAspNikolaRiorovic.Application.DataTransfer;
using ProjekatAspNikolaRiorovic.EFDataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ProjekatAspNikolaRiorovic.Implementation.Validators
{
    public class UlogaIdValidator : AbstractValidator<UpdateKorisnikDto>
    {
        public UlogaIdValidator(ProjekatAspNikolaRiorovicContext context)
        {

            RuleFor(y => y.IdUloga)
               .Must(idUloga => context.Uloge.Any(k => k.Id == idUloga))
             .WithMessage("Uloga mora da postoji u bazi!");
 
        }
    }
}
