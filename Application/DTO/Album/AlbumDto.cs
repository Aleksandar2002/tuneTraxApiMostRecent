using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Application.DTO.Artist;
using Application.DTO.Track;

namespace Application.DTO.Album
{
    public class BaseAlbumDto
    {
        public string Name { get; set; }
        public int Id { get; set; }
    }
    public class AlbumDto : BaseAlbumDto
    {

        public DateTime ReleaseDate { get; set; }
    }
    public class DetailedAlbumDto : AlbumDto
    {
        public ArtistDto Artist { get; set; }
        public List<TrackBasicDto> Tracks { get; set; }
    }
}
