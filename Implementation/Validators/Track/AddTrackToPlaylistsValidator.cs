using Application;
using Application.DTO.Track;
using DataAccess;
using FluentValidation;

namespace Implementation.Validators.Track;

public class AddTrackToPlaylistsValidator : AbstractValidator<AddTrackToPlaylistsDto>
{
    public AddTrackToPlaylistsValidator(TuneTraxContext context, IApplicationActor actor)
    {
        CascadeMode = CascadeMode.StopOnFirstFailure;
        RuleFor(x => x.TrackId).Must(x => context.Tracks.Any(t => t.Id == x)).WithMessage("Track does not exist");

        RuleFor(x => x.Playlists).Must(x => x != null && x.Count > 0).WithMessage("Playlists are required")
                    .Must(x =>
                    {
                        var existingPlaylists = context.Playlists.Where(p => x.Contains(p.Id) && actor.Id == p.UserId && p.IsActive).Select(a => a.Id).ToList();
                        return existingPlaylists.Count == x.Count;
                    }).WithMessage("Some of the playlists does not exist in database, or you are not their owner");
    }
}
