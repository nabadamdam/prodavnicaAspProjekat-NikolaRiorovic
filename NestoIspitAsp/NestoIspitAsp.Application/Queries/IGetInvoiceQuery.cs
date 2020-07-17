using NestoIspitAsp.Application.DataTransfer;
using NestoIspitAsp.Application.Searches;
using System;
using System.Collections.Generic;
using System.Text;

namespace NestoIspitAsp.Application.Queries
{
    public interface IGetInvoiceQuery : IQuery<InvoiceSearch,PageResponse<InvoiceDto>>
    {
    }
}
