using FluentValidation;
using ProjekatAspNikolaRiorovic.Application.DataTransfer;
using ProjekatAspNikolaRiorovic.EFDataAccess;
using System;
using System.Collections.Generic;
using System.Text;
using System.Linq;

namespace ProjekatAspNikolaRiorovic.Implementation.Validators
{
    public class CreatePravljenjePorudzbineValidator : AbstractValidator<PravljenjePorudzbineDto>
    {
        public CreatePravljenjePorudzbineValidator(ProjekatAspNikolaRiorovicContext context)
        {
            
            RuleFor(x => x.DatumPorudzbine)
                .GreaterThan(DateTime.Today)
                .WithMessage("Datum mora biti u buducnosti")
                .LessThan(DateTime.Now.AddDays(30))
                .WithMessage("Datum porudzbine ne sme biti veci od 30 dana od danasnjeg dana");
            RuleFor(x => x.Adresa)
               .NotEmpty()
               .WithMessage("Polje adresa je obavezno");
            RuleFor(x => x.Stavke)
              .NotEmpty()
              .WithMessage("Mora postojati barem jedan detalj porudzbine")
              .Must(i => i.Select(x => x.IdProduct).Distinct().Count() == i.Count())
              .WithMessage("Upisivanje vise istih proizvoda nije dozvoljen")
              .DependentRules(() =>
              {
                  RuleForEach(x => x.Stavke)
                    .SetValidator(new CreateDetaljiPorudzbineValidator(context));
              });
                
           

        }
    }
}
