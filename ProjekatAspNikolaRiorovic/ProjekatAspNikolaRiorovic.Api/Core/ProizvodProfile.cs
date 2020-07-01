using AutoMapper;
using ProjekatAspNikolaRiorovic.Application.DataTransfer;
using ProjekatAspNikolaRiorovic.Domain.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ProjekatAspNikolaRiorovic.Api.Core
{
    public class ProizvodProfile : Profile
    {
        public ProizvodProfile()
        {
            CreateMap<Proizvod, ProizvodDto>();
            CreateMap<ProizvodDto, Proizvod>();
        }
    }
}
