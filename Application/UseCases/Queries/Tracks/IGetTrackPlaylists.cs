using Application.DTO.Track;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.UseCases.Queries.Tracks
{
    public interface IGetTrackPlaylists : IQuery<int, List<TrackPlaylistDto>>
    {
    }
}
