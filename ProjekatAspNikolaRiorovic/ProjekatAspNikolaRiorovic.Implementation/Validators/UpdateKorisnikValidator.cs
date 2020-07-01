using FluentValidation;
using ProjekatAspNikolaRiorovic.Application.DataTransfer;
using ProjekatAspNikolaRiorovic.EFDataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ProjekatAspNikolaRiorovic.Implementation.Validators
{
    public class UpdateKorisnikValidator : AbstractValidator<UpdateKorisnikDto>
    {
        public UpdateKorisnikValidator(ProjekatAspNikolaRiorovicContext context)
        {
            RuleFor(y => y.Id)
               .NotEmpty()
               .WithMessage("Polje id ne sme da bude prazno! ")
                .DependentRules(() => {
                    RuleFor(y => y.Id)
                        .Must(idKorisnik => context.Korisnici.Any(k => k.Id == idKorisnik))
                        .WithMessage("Polje id mora da postoji u bazi!");


                });
            RuleFor(y => y.Email)
                .NotEmpty()
                .WithMessage("Polje email ne sme da bude prazno! ");
            RuleFor(y => y.Ime)
                .NotEmpty()
                .MinimumLength(3)
                .WithMessage("Polje ime ne sme da bude prazno!");
            RuleFor(y => y.Prezime)
               .NotEmpty()
               .MinimumLength(3)
               .WithMessage("Polje prezime ne sme da bude prazno!");
            RuleFor(y => y.Password)
               .NotEmpty()
               .MinimumLength(5)
               .WithMessage("Polje ime ne sme da bude prazno i ne sme imati manje od 6 karaktera!");
            RuleFor(y => y.IdUloga)
               .NotEmpty()
               .WithMessage("Polje id uloga ne sme da bude prazno !");
        }
    }
}
