using APi.Controllers;
using Application.UseCaseHandling.CommandHandlers;
using Application.UseCaseHandling.QueryHandlers;
using Application.UseCases.Queries.Countries;
using Application.UseCases.Queries.Searches;
using Microsoft.AspNetCore.Mvc;

namespace API.Controllers;


[Route("/api/[controller]")]
[ApiController]
public class CountriesController : BaseController
{
    public CountriesController(ICommandHandler commandHandler, IQueryHandler queryHandler) : base(commandHandler, queryHandler)
    {
    }

    [HttpGet]
    public IActionResult Get([FromServices] IGetCountriesQuery query, [FromQuery] CountrySearch search)
    {
        return Ok(QueryHandler.HandleQuery(query, search));
    }


}
