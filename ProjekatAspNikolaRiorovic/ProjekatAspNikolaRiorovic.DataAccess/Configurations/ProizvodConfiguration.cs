using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using ProjekatAspNikolaRiorovic.Domain.Entity;
using System;
using System.Collections.Generic;
using System.Text;

namespace ProjekatAspNikolaRiorovic.EFDataAccess.Configurations
{
    public class ProizvodConfiguration : IEntityTypeConfiguration<Proizvod>
    {
        public void Configure(EntityTypeBuilder<Proizvod> builder)
        {
            builder.Property(y => y.Naziv).HasMaxLength(50).IsRequired();
            builder.HasIndex(y => y.Naziv).IsUnique();
            builder.Property(y => y.Kolicina).IsRequired();
            builder.Property(y => y.Slika).HasMaxLength(100).IsRequired();
            builder.Property(y => y.Opis).HasMaxLength(250).IsRequired();
            builder.Property(y => y.IdKat).IsRequired();
            builder.HasMany(c => c.Cenovnici).WithOne(p => p.Proizvod).HasForeignKey(p => p.IdProizvod).OnDelete(DeleteBehavior.Restrict);
            builder.HasMany(c => c.Slike).WithOne(p => p.Proizvod).HasForeignKey(p => p.IdProizvod).OnDelete(DeleteBehavior.Restrict);
            builder.HasMany(p => p.DetaljiPorudzbina).WithOne(dp => dp.Proizvod).HasForeignKey(dp => dp.IdProizvod).OnDelete(DeleteBehavior.Restrict);
        }
    }
}
