using System;
using System.Collections.Generic;
using System.Text;

namespace NestoIspitAsp.Application.Queries
{
    public abstract class PageSearch
    {
        public int PoStrani { get; set; } = 3;
        public int Strana { get; set; } = 1;
    }
}
