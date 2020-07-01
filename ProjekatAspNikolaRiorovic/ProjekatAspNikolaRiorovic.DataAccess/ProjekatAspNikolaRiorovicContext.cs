using Microsoft.EntityFrameworkCore;
using ProjekatAspNikolaRiorovic.Domain;
using ProjekatAspNikolaRiorovic.Domain.Entity;
using ProjekatAspNikolaRiorovic.EFDataAccess.Configurations;
using System;
using System.Collections.Generic;
using System.Text;

namespace ProjekatAspNikolaRiorovic.EFDataAccess
{
    public class ProjekatAspNikolaRiorovicContext : DbContext
    {
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.ApplyConfiguration(new KorisnikConfiguration());
            modelBuilder.ApplyConfiguration(new KategorijaConfiguration());
            modelBuilder.ApplyConfiguration(new ProizvodConfiguration());
            modelBuilder.ApplyConfiguration(new UlogaConfiguration());
            modelBuilder.ApplyConfiguration(new SlikaConfiguration());
            modelBuilder.ApplyConfiguration(new CenovnikConfiguration());
            modelBuilder.ApplyConfiguration(new PorudzbinaConfiguration());
            modelBuilder.ApplyConfiguration(new KorisnikUseCaseConfiguration());
            modelBuilder.Entity<Proizvod>().HasQueryFilter(p => !p.IsDeleted);
            modelBuilder.Entity<Korisnik>().HasQueryFilter(p => !p.IsDeleted);
            modelBuilder.Entity<Kategorija>().HasQueryFilter(p => !p.IsDeleted);
            modelBuilder.Entity<Uloga>().HasQueryFilter(p => !p.IsDeleted);
            modelBuilder.Entity<Slika>().HasQueryFilter(p => !p.IsDeleted);
            modelBuilder.Entity<Cenovnik>().HasQueryFilter(p => !p.IsDeleted);
            modelBuilder.Entity<Porudzbina>().HasQueryFilter(p => !p.IsDeleted);
            modelBuilder.Entity<DetaljiPorudzbine>().HasQueryFilter(p => !p.IsDeleted);
        }
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer(@"Data Source=DESKTOP-EATAEUD\SQLEXPRESS;Initial Catalog=shopNikolaAsp;Integrated Security=True");
            base.OnConfiguring(optionsBuilder);
        }
        public override int SaveChanges()
        {
            foreach (var entry in ChangeTracker.Entries())
            {
                if (entry.Entity is Entity e)
                {
                    switch (entry.State)
                    {
                        case EntityState.Added:
                            e.CreatedAt = DateTime.Now;
                            e.DeletedAt = null;
                            e.IsActive = true;
                            e.IsDeleted = false;
                            e.ModifiedAt = null;
                            break;
                        case EntityState.Modified:
                            if(e.IsDeleted == true)
                            {
                                break;
                            }
                            else
                            {
                                e.ModifiedAt = DateTime.Now;
                            }
                            break;
                      

                    }

                }
            }
            return base.SaveChanges();
        }
        
        public DbSet<Korisnik> Korisnici { get; set; }
        public DbSet<Proizvod> Proizvodi { get; set; }
        public DbSet<Uloga> Uloge { get; set; }
        public DbSet<Kategorija> Kategorije { get; set; }
        public DbSet<Cenovnik> Cenovnici { get; set; }
        public DbSet<Slika> Slike { get; set; }
        public DbSet<Porudzbina> Porudzbine { get; set; }
        public DbSet<DetaljiPorudzbine> DetaljiPorudzbina { get; set; }
        public DbSet<KorisnikUseCase> KorisnikUseCases { get; set; }
        public DbSet<UseCaseLog> UseCaseLogs { get; set; }
    }
}
