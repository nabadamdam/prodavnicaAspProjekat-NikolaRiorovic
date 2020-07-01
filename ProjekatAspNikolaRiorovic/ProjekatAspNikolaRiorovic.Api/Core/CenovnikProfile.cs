using AutoMapper;
using ProjekatAspNikolaRiorovic.Application.DataTransfer;
using ProjekatAspNikolaRiorovic.Domain.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ProjekatAspNikolaRiorovic.Api.Core
{
    public class CenovnikProfile : Profile
    {
        public CenovnikProfile()
        {
            CreateMap<Cenovnik, CenovnikDto>();
            CreateMap<CenovnikDto, Cenovnik>();
        }
    }
}
