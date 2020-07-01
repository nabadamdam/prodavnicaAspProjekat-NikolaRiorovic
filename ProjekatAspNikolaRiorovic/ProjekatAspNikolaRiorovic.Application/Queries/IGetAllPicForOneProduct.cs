using ProjekatAspNikolaRiorovic.Application.DataTransfer;
using System;
using System.Collections.Generic;
using System.Text;

namespace ProjekatAspNikolaRiorovic.Application.Queries
{
    public interface IGetAllPicForOneProduct : IQuery<int,IEnumerable<PicturesForProductDto>>
    {
    }
}
