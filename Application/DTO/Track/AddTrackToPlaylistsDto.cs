namespace Application.DTO.Track;

public class AddTrackToPlaylistsDto
{
    public List<int> Playlists { get; set; }
    public int? TrackId { get; set; }
}
