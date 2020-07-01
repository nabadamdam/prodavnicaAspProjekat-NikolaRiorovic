using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using ProjekatAspNikolaRiorovic.Domain.Entity;
using System;
using System.Collections.Generic;
using System.Text;

namespace ProjekatAspNikolaRiorovic.EFDataAccess.Configurations
{
    public class KorisnikUseCaseConfiguration : IEntityTypeConfiguration<KorisnikUseCase>
    {
        public void Configure(EntityTypeBuilder<KorisnikUseCase> builder)
        {
            builder.Property(y => y.IdKorisnik).IsRequired();
            builder.Property(y => y.IdUseCase).IsRequired();
        }
    }
}
