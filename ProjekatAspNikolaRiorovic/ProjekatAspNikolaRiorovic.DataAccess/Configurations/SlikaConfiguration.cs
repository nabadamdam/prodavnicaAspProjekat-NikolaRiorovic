using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using ProjekatAspNikolaRiorovic.Domain.Entity;
using System;
using System.Collections.Generic;
using System.Text;

namespace ProjekatAspNikolaRiorovic.EFDataAccess.Configurations
{
    public class SlikaConfiguration : IEntityTypeConfiguration<Slika>
    {
        public void Configure(EntityTypeBuilder<Slika> builder)
        {
            builder.Property(y => y.Putanja).HasMaxLength(100).IsRequired();
            builder.Property(y => y.IdProizvod).IsRequired();
        }
    }
}
