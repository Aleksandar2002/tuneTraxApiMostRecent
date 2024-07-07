using Application.DTO.Track;
using Application.UseCases.Queries.Searches;

namespace Application.UseCases.Queries.Tracks;

public interface IGetTrackQueueQuery : IQuery<TrackQueueSearch, List<int>>
{

}
