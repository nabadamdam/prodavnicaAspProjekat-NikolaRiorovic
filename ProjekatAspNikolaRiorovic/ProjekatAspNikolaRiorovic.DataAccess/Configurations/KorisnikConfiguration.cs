using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using ProjekatAspNikolaRiorovic.Domain.Entity;
using System;
using System.Collections.Generic;
using System.Text;

namespace ProjekatAspNikolaRiorovic.EFDataAccess.Configurations
{
    public class KorisnikConfiguration : IEntityTypeConfiguration<Korisnik>
    {
        public void Configure(EntityTypeBuilder<Korisnik> builder)
        {
            builder.Property(y => y.Ime).HasMaxLength(25).IsRequired();
            builder.Property(y => y.Prezime).HasMaxLength(25).IsRequired();
            builder.Property(y => y.Password).HasMaxLength(25).IsRequired();
            builder.Property(y => y.Email).HasMaxLength(50).IsRequired();
            builder.HasIndex(y => y.Email).IsUnique();
            builder.Property(y => y.Password).HasMaxLength(130).IsRequired();
            builder.Property(y => y.Jmbg).IsRequired();
            builder.HasIndex(y => y.Jmbg).IsUnique();
            builder.Property(y => y.IdUloga).IsRequired();
            builder.HasMany(p => p.Porudzbine).WithOne(dp => dp.Korisnik).HasForeignKey(dp => dp.IdKorisnik).OnDelete(DeleteBehavior.Restrict);
            builder.HasMany(p => p.KorisnikUseCases).WithOne(dp => dp.Korisnik).HasForeignKey(dp => dp.IdKorisnik).OnDelete(DeleteBehavior.Cascade);
        }
    }
}
