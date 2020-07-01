using ProjekatAspNikolaRiorovic.Application.DataTransfer;
using System;
using System.Collections.Generic;
using System.Text;

namespace ProjekatAspNikolaRiorovic.Application.Queries
{
    public interface IGetOneKategorijaQuery : IQuery<int, KategorijaWithIdDto>
    {
    }
}
