using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using ProjekatAspNikolaRiorovic.Domain.Entity;
using System;
using System.Collections.Generic;
using System.Text;

namespace ProjekatAspNikolaRiorovic.EFDataAccess.Configurations
{
    public class UlogaConfiguration : IEntityTypeConfiguration<Uloga>
    {
        public void Configure(EntityTypeBuilder<Uloga> builder)
        {
            builder.Property(y => y.Naziv).HasMaxLength(25).IsRequired();

            builder.HasMany(u => u.Korisnici).WithOne(k => k.Uloga).HasForeignKey(k => k.IdUloga).OnDelete(DeleteBehavior.Restrict);
        }
    }
}
