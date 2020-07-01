using FluentValidation;
using Microsoft.EntityFrameworkCore.Internal;
using ProjekatAspNikolaRiorovic.Application.DataTransfer;
using ProjekatAspNikolaRiorovic.EFDataAccess;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Security.Cryptography;
using System.Text;

namespace ProjekatAspNikolaRiorovic.Implementation.Validators
{
    public class CreateKorisnikValidator : AbstractValidator<KorisnikDto>
    {
        public CreateKorisnikValidator(ProjekatAspNikolaRiorovicContext context)
        {
            RuleFor(y => y.Email)
                .NotEmpty()
                .Must(email => !context.Korisnici.Any(k => k.Email == email))
                .WithMessage("Email mora biti jedinstven.Vec postoji neko sa ovim email!");
            RuleFor(y => y.Ime)
                .NotEmpty()
                .MinimumLength(3)
                .WithMessage("Polje ime ne sme da bude prazno i mora imati minimum 3 karaktera!");
            RuleFor(y => y.Prezime)
               .NotEmpty()
               .MinimumLength(3)
               .WithMessage("Polje prezime ne sme da bude prazno!");
            RuleFor(y => y.Jmbg)
               .NotEmpty()
               .Must(jmbg => !context.Korisnici.Any(k => k.Jmbg == jmbg))
               .WithMessage("Polje jmbg ne sme da bude prazno i mora da bude jedinstveno!");
            RuleFor(y => y.Password)
               .NotEmpty()
               .MinimumLength(5)
               .WithMessage("Polje ime ne sme da bude prazno i ne sme imati manje od 6 karaktera!");
        }
        
    }
}
