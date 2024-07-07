using Application.DTO.Album;
using Application.DTO.Artist;
using Application.DTO.Track;
using AutoMapper;
using Domain.Entities;

namespace Implementation.Mappers;

public class AlbumProfile : Profile
{
    public AlbumProfile()
    {
        CreateMap<Album, DetailedAlbumDto>()
        .ForMember(d => d.Artist, y => y.MapFrom(s => new ArtistDto { Name = s.Artist.Name, Id = s.Artist.Id }))
        .ForMember(d => d.Tracks, y => y.MapFrom(s => s.Tracks.Select(x => new TrackBasicDto { Title = x.Title, Id = x.Id }).ToList()));

        CreateMap<Album, AlbumDto>();
    }

}
