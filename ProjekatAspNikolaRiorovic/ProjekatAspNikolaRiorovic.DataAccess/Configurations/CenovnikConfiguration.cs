using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using ProjekatAspNikolaRiorovic.Domain.Entity;
using System;
using System.Collections.Generic;
using System.Text;

namespace ProjekatAspNikolaRiorovic.EFDataAccess.Configurations
{
    public class CenovnikConfiguration : IEntityTypeConfiguration<Cenovnik>
    {
        public void Configure(EntityTypeBuilder<Cenovnik> builder)
        {
            builder.Property(y => y.CenaProizvod).IsRequired();
            builder.Property(y => y.IdProizvod).IsRequired();
        }
    }
}
