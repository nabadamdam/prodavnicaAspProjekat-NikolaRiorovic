using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using ProjekatAspNikolaRiorovic.Domain.Entity;
using System;
using System.Collections.Generic;
using System.Text;

namespace ProjekatAspNikolaRiorovic.EFDataAccess.Configurations
{
    public class KategorijaConfiguration : IEntityTypeConfiguration<Kategorija>
    {
        public void Configure(EntityTypeBuilder<Kategorija> builder)
        {
            builder.Property(y => y.Naziv).HasMaxLength(50).IsRequired();
            builder.HasIndex(y => y.Naziv).IsUnique();

            builder.HasMany(c => c.Proizvodi).WithOne(p => p.Kategorija).HasForeignKey(p => p.IdKat).OnDelete(DeleteBehavior.Restrict);
        }
    }
}
