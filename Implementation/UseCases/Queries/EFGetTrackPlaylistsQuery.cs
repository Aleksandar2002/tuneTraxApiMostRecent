using Application.DTO.Track;
using Application.Exceptions;
using Application.UseCases.Queries.Tracks;
using DataAccess;
using Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Implementation.UseCases.Queries
{
    public class EFGetTrackPlaylistsQuery : EFUseCase, IGetTrackPlaylists
    {
        public EFGetTrackPlaylistsQuery(TuneTraxContext context) : base(context)
        {
        }

        public string Name => "Get track playlists";

        public int Id => 42;

        public List<TrackPlaylistDto> Execute(int search)
        {
            var track = Context.Tracks.FirstOrDefault(x => x.Id == search && x.IsActive);

            if(track == null)
            {
                throw new EntityNotFoundException(search, typeof(Track).Name);
            }

            return track.Playlists.Select(x => new TrackPlaylistDto { 
            Id=  x.Id,
            Name = x.Name
            }).ToList();
        }
    }
}
