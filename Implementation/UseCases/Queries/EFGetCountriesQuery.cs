using Application;
using Application.DTO.Country;
using Application.UseCases;
using Application.UseCases.Queries.Countries;
using Application.UseCases.Queries.Searches;
using AutoMapper;
using DataAccess;

namespace Implementation.UseCases.Queries;

public class EFGetCountriesQuery : EFUseCase, IGetCountriesQuery
{
    private IMapper _mapper;
    public EFGetCountriesQuery(TuneTraxContext context, IMapper mapper) : base(context)
    {
        _mapper = mapper;

    }

    public string Name => "Get countries";

    public int Id => 39;

    public PagedResponse<CountryDto> Execute(CountrySearch search)
    {
        var query = Context.Countries.Where(x => x.IsActive);

        var totalCount = query.Count();
        var page = search.Page.HasValue ? search.Page.Value : 1;
        var perPage = search.PerPage.HasValue ? search.PerPage.Value : 10;

        return new PagedResponse<CountryDto>
        {
            PerPage = perPage,
            CurrentPage = page,
            TotalCount = totalCount,
            Data = query.Skip((page - 1) * perPage).Take(perPage).Select(x => _mapper.Map<CountryDto>(x))
        };
    }
}
