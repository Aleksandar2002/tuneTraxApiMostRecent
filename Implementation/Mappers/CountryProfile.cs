using Application.DTO.Country;
using AutoMapper;
using Domain.Entities;

namespace Implementation.Mappers;

public class CountryProfile : Profile
{
    public CountryProfile()
    {
        CreateMap<Country, CountryDto>();
    }
}
