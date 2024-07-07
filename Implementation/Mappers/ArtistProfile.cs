using Application.DTO.Album;
using Application.DTO.Artist;
using Application.DTO.Country;
using Application.DTO.Genre;
using Application.DTO.Track;
using AutoMapper;
using DataAccess;
using Domain.Entities;
using Implementation.Validators.Artist;

namespace Implementation.Mappers;

public class ArtistProfile : Profile
{
    public ArtistProfile()
    {
        var context = new TuneTraxContext();

        CreateMap<Artist, ArtistDto>();

        CreateMap<Artist, DetailedArtistDto>()
                .ForMember(d => d.Country, x => x.MapFrom(d => new CountryDto { Id = d.Country.Id, Name = d.Country.Name }))
                .ForMember(d => d.Image, x => x.MapFrom(d => d.Image != null ? $"artists/{d.Image}" : "artists/default.jpg"))
                .ForMember(d => d.Albums, x => x.MapFrom((s, d, _, context) => s.Albums.Select(a => new BaseAlbumDto { Name = a.Name, Id = a.Id }).ToList()))
                .ForMember(d => d.Genres, x => x.MapFrom((s, d, _, context) => s.Genres.Select(t => new GenreDto { Id = t.Id, Name = t.Name }).ToList()))
                .ForMember(d => d.Tracks, x => x.MapFrom((s, d, _, context) => s.Tracks.Select(t => new TrackBasicDto { Id = t.Id, Title = t.Title }).ToList()));


        CreateMap<Artist, CreateArtistDto>().ReverseMap()
        .ForMember(d => d.Genres, x => x.MapFrom(s => context.Genres.Where(g => s.Genres.Contains(g.Id) && g.IsActive).ToList()));
    }
}
