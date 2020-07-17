using System;
using System.Collections.Generic;
using System.Text;

namespace NestoIspitAsp.Application.DataTransfer
{
    public class InvoiceDto
    {
        public int Id { get; set; }
        public string ImeKupca { get; set; }
        public string PrezimeKupca { get; set; }
        public string EmailKupca { get; set; }
        public string TelefonKupca { get; set; }
        public string BillingAdresa { get; set; }
        public string BillingGrad { get; set; }
        public string BillingRegion { get; set; }
        public string BillingDrzava { get; set; }
        public string BillingPostanskiBroj { get; set; }
        public ICollection<InvoiceLineDto> StavkeFakture { get; set; }
    }

    public class InvoiceLineDto
    {
        public int Id { get; set; }
        public string NazivPesme { get; set; }
        public decimal Cena { get; set; }
        public int Kolicina { get; set; }

    }
}
