using FluentValidation;
using ProjekatAspNikolaRiorovic.Application.DataTransfer;
using ProjekatAspNikolaRiorovic.EFDataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;

namespace ProjekatAspNikolaRiorovic.Implementation.Validators
{
    public class CreateKategorijaValidator : AbstractValidator<KategorijaDto>
    {
        public CreateKategorijaValidator(ProjekatAspNikolaRiorovicContext context)
        {
            RuleFor(y => y.Naziv)
                .NotEmpty()
                .Must(naziv => !context.Kategorije.Any(y => y.Naziv == naziv))
                .WithMessage("Polje naziv kategorije ne sme biti prazno i mora biti jednistveno");
        }
    }
}
