using Application.DTO.Track;
using Application.UseCases.Queries.Searches;
using Application.UseCases.Queries.Tracks;
using DataAccess;
using FluentValidation;

namespace Implementation.UseCases.Queries;

public class EFGetTrackQueueQuery : EFUseCase, IGetTrackQueueQuery
{
    public EFGetTrackQueueQuery(TuneTraxContext context) : base(context)
    {
    }


    public string Name => "Get track queue";

    public int Id => 41;

    public List<int> Execute(TrackQueueSearch search)
    {
        if (search.NumberOfTracks > 0 && search.NumberOfTracks <= 50)
        {
            return new List<int>();
        }

        return Context.Tracks.Where(x => x.IsActive).OrderByDescending(x => x.CreatedAt).Select(x => x.Id).Take(50).ToList();

    }

}
