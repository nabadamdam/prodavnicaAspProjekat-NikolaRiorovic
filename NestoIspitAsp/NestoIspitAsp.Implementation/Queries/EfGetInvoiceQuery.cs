using Microsoft.EntityFrameworkCore;
using NestoIspitAsp.Application.DataTransfer;
using NestoIspitAsp.Application.Queries;
using NestoIspitAsp.Application.Searches;
using NestoIspitAsp.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace NestoIspitAsp.Implementation.Queries
{
    public class EfGetInvoiceQuery : IGetInvoiceQuery
    {
        private readonly ChinookContext context;

        public EfGetInvoiceQuery(ChinookContext context)
        {
            this.context = context;
        }

        public int Id => 1;

        public string Opis => "Dohvatanje invoice putem Ef-a";

        public PageResponse<InvoiceDto> Execute(InvoiceSearch search)
        {
            var query = context.Invoice.Include(x => x.InvoiceLine).ThenInclude(x => x.Track).AsQueryable();
            if(!string.IsNullOrEmpty(search.NazivPesme) || !string.IsNullOrWhiteSpace(search.NazivPesme))
            {
                query = query.Where(x => x.InvoiceLine.Any(x => x.Track.Name.ToLower().Contains(search.NazivPesme.ToLower())));
            }
            if(search.IdKupca > 0)
            {
                query = query.Where(x => x.CustomerId == search.IdKupca);
            }
            if (!string.IsNullOrEmpty(search.KompanijaKupca) || !string.IsNullOrWhiteSpace(search.KompanijaKupca))
            {
                query = query.Where(x=>x.Customer.Company.ToLower().Contains(search.KompanijaKupca.ToLower()));
            }
            if (!string.IsNullOrEmpty(search.DrzavaKupca) || !string.IsNullOrWhiteSpace(search.DrzavaKupca))
            {
                query = query.Where(x => x.Customer.Country.ToLower().Contains(search.DrzavaKupca.ToLower()));
            }
            if (search.MinimalnaCena > 0) 
            {
                query = query.Where(x => x.Total >= search.MinimalnaCena);
            }
            if (search.MaxCena > 0)
            {
                query = query.Where(x => x.Total <= search.MaxCena);
            }
            var preskokBrojanja = search.PoStrani * (search.Strana - 1);
            var odgovor = new PageResponse<InvoiceDto>
            {
                UkupanBrojStavki = query.Count(),
                StavkePoStrani = search.PoStrani,
                TrenutnaStrana = search.Strana,
                Stavke = query.Skip(preskokBrojanja).Take(search.PoStrani).Select(x => new InvoiceDto
                {
                    Id = x.InvoiceId,
                    ImeKupca = x.Customer.FirstName,
                    PrezimeKupca = x.Customer.LastName,
                    EmailKupca = x.Customer.Email,
                    TelefonKupca = x.Customer.Phone,
                    BillingAdresa = x.BillingAddress,
                    BillingGrad = x.BillingCity,
                    BillingRegion = x.BillingState,
                    BillingDrzava = x.BillingCountry,
                    BillingPostanskiBroj = x.BillingPostalCode,
                    StavkeFakture = x.InvoiceLine.Where(y => y.InvoiceId == x.InvoiceId).Select(i => new InvoiceLineDto
                    {
                        Id = i.InvoiceId,
                        NazivPesme = i.Track.Name,
                        Cena = i.UnitPrice,
                        Kolicina = i.Quantity
                    }).ToList()
                })
            };
            return odgovor;
        }
    }
}
