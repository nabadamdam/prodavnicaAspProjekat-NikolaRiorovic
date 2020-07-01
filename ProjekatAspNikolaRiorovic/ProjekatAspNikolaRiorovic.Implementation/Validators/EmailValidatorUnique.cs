using FluentValidation;
using ProjekatAspNikolaRiorovic.Application.DataTransfer;
using ProjekatAspNikolaRiorovic.EFDataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ProjekatAspNikolaRiorovic.Implementation.Validators
{
    public class EmailValidatorUnique : AbstractValidator<UpdateKorisnikDto>
    {
        public EmailValidatorUnique(ProjekatAspNikolaRiorovicContext context)
        {

            RuleFor(y => y.Email)
                  .Must(email => !context.Korisnici.Any(k => k.Email == email))
                  .WithMessage("Ovaj Email vec postoji u bazi od strane drugog korisnika!");

        }
    }
}
