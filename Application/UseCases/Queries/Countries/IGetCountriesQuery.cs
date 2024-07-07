using Application.DTO.Country;
using Application.UseCases.Queries.Searches;

namespace Application.UseCases.Queries.Countries;

public interface IGetCountriesQuery : IQuery<CountrySearch, PagedResponse<CountryDto>>
{

}
