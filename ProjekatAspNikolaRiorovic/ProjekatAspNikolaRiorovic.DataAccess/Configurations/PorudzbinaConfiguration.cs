using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using ProjekatAspNikolaRiorovic.Domain.Entity;
using System;
using System.Collections.Generic;
using System.Text;

namespace ProjekatAspNikolaRiorovic.EFDataAccess.Configurations
{
    public class PorudzbinaConfiguration : IEntityTypeConfiguration<Porudzbina>
    {
        public void Configure(EntityTypeBuilder<Porudzbina> builder)
        {
            builder.Property(y => y.NacinPlacanja).HasDefaultValue(NacinPlacanja.kes);
            builder.Property(y => y.StatusPorudzbine).HasDefaultValue(StatusPorudzbine.primljena);
            builder.Property(y => y.Adresa).HasMaxLength(50).IsRequired();
            builder.Property(y => y.DatumPorudzbine).IsRequired();
            builder.Property(y => y.IdKorisnik).IsRequired();
            builder.HasMany(p => p.DetaljiPorudzbina).WithOne(dp => dp.Porudzbina).HasForeignKey(dp => dp.IdPorudzbina).OnDelete(DeleteBehavior.Restrict);

        }
    }
}
