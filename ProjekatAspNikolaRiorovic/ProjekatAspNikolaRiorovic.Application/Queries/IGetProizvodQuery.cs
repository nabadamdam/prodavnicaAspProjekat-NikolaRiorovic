using ProjekatAspNikolaRiorovic.Application.DataTransfer;
using ProjekatAspNikolaRiorovic.Application.Searches;
using System;
using System.Collections.Generic;
using System.Text;

namespace ProjekatAspNikolaRiorovic.Application.Queries
{
    public interface IGetProizvodQuery: IQuery<ProizvodSearch,PagedResponse<GetProizvodDto>>
    {
    }
}
