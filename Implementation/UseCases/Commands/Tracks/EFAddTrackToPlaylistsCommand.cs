using Application.DTO.Track;
using Application.UseCases.Commands.Tracks;
using DataAccess;
using Domain.Entities;
using FluentValidation;
using Implementation.Validators.Track;

namespace Implementation.UseCases.Commands.Tracks;

public class EFAddTrackToPlaylistsCommand : EFUseCase, IAddTrackToPlaylistsCommand
{
    private AddTrackToPlaylistsValidator _validator;
    public EFAddTrackToPlaylistsCommand(TuneTraxContext context, AddTrackToPlaylistsValidator validator) : base(context)
    {
        _validator = validator;

    }


    public string Name => "Add track to playlists";

    public int Id => 40;

    public void Execute(AddTrackToPlaylistsDto request)
    {
        _validator.ValidateAndThrow(request);


        var existingPlaylists = Context.PlaylistTrack.Where(x => x.TrackId == request.TrackId).ToList();
        Context.PlaylistTrack.RemoveRange(existingPlaylists);

        Context.PlaylistTrack.AddRange(request.Playlists.Select(x => new PlaylistTrack
        {
            PlaylistId = x,
            TrackId = request.TrackId.Value
        }));

        Context.SaveChanges();

    }

}
