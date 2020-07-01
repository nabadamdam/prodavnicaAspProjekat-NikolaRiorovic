using FluentValidation;
using Microsoft.EntityFrameworkCore.Internal;
using ProjekatAspNikolaRiorovic.Application.DataTransfer;
using ProjekatAspNikolaRiorovic.EFDataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;

namespace ProjekatAspNikolaRiorovic.Implementation.Validators
{
    public class CreateUlogaValidator : AbstractValidator<UlogaDto>
    {
        public CreateUlogaValidator(ProjekatAspNikolaRiorovicContext context)
        {
            RuleFor(y => y.Naziv)
                .NotEmpty()
                .Must(naziv => !context.Uloge.Any(y => y.Naziv == naziv))
                .WithMessage("Polje naziv uloge ne sme biti prazno i mora biti jedinstveno");

        }
    }
}
