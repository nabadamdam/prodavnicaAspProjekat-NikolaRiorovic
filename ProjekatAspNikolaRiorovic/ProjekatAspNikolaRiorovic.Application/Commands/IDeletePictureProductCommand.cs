﻿using ProjekatAspNikolaRiorovic.Application.DataTransfer;
using System;
using System.Collections.Generic;
using System.Text;

namespace ProjekatAspNikolaRiorovic.Application.Commands
{
    public interface IDeletePictureProductCommand : ICommand<IEnumerable<PicturesForProductDto>>
    {
    }
}
