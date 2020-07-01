using FluentValidation;
using ProjekatAspNikolaRiorovic.Application.DataTransfer;
using ProjekatAspNikolaRiorovic.EFDataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ProjekatAspNikolaRiorovic.Implementation.Validators
{
    public class ProizvodNazivValidator : AbstractValidator<UpdateProizvodDto>
    {
        public ProizvodNazivValidator(ProjekatAspNikolaRiorovicContext context)
        {
            RuleFor(y => y.Naziv)
              .Must(naziv => !context.Proizvodi.Any(k => k.Naziv == naziv))
              .WithMessage("Proizvod sa ovim nazivom vec postoji u bazi!");
        }
    }
}
