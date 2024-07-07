using API.DTO;
using API.Extensions;
using API.JWT;
using API.JWT.TokenStorage;
using API.Middlewares;
using Application;
using Application.Logging;
using Application.UseCaseHandling.CommandHandlers;
using Application.UseCaseHandling.QueryHandlers;
using DataAccess;
using Implementation;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.IdentityModel.Tokens;
using System.Text;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

var appSettings = new AppSettings();

builder.Configuration.Bind(appSettings);

builder.Services.AddCors(x=> x.AddPolicy("police1", build =>
{
    build.AllowAnyOrigin().AllowAnyMethod().AllowAnyHeader();
}));

builder.Services.AddControllers();


builder.Services.AddHttpContextAccessor();



builder.Services.AddUseCaseCommands();
builder.Services.AddValidators();

builder.Services.AddUseCaseQueries();


builder.Services.AddLoggers();



// ---------------------------------- HANDLERS

builder.Services.AddTransient<IQueryHandler>(x =>
{
    var actor = x.GetService<IApplicationActor>();
    var logger = x.GetService<IUseCaseLogger>();

    var handler = new QueryHandler();
    var timeTrackingHandler = new TimeTrackingQueryHandler(handler);
    var loggingHandler = new LoggingQueryHandler(timeTrackingHandler, actor, logger);
    var decorator = new AuthorizationQueryHandler(loggingHandler, actor);

    return decorator;
});
builder.Services.AddTransient<ICommandHandler, CommandHandler>();





// --------------------------------------- OTHER

builder.Services.AddTransient<TuneTraxContext>(x => new TuneTraxContext(appSettings.ConnectionString));




// ------------------------------ JWT

builder.Services.AddTransient<CreateJwtToken>(x =>
{
    var context = x.GetRequiredService<TuneTraxContext>();
    return new CreateJwtToken(context, appSettings);
});




builder.Services.AddApplicationActorAndProvider();
builder.Services.AddTransient<ITokenStorage, DBTokenStorage>();


// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();


builder.Services.AddAutoMapper(typeof(Actor).Assembly);

// dotnet add MyApp package MySql.Data -Version 8.0.31

builder.Services.AddAuthentication(options =>
{
    options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
    options.DefaultSignInScheme = JwtBearerDefaults.AuthenticationScheme;
    options.DefaultScheme = JwtBearerDefaults.AuthenticationScheme;
}).AddJwtBearer(cfg =>
{
    cfg.RequireHttpsMetadata = false;
    cfg.SaveToken = true;
    cfg.TokenValidationParameters = new TokenValidationParameters
    {
        ValidIssuer = appSettings.Jwt.Issuer,
        ValidateIssuer = true,
        ValidAudience = "Any",
        ValidateAudience = true,
        IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(appSettings.Jwt.SecretKey)),
        ValidateIssuerSigningKey = true,
        ValidateLifetime = true,
        ClockSkew = TimeSpan.Zero
    };
    cfg.Events = new JwtBearerEvents
    {
        OnTokenValidated = context =>
        {

            var claims = context.HttpContext.Request.GetTokenClaims();
            Guid tokenId = Guid.Parse(claims.First(x => x.Type == "jti").Value);

            var storage = builder.Services.BuildServiceProvider().GetService<ITokenStorage>();

            if (storage == null || storage.Exists(tokenId))
            {
                context.Fail("Invalid token");
            }


            return Task.CompletedTask;

        }
    };
});





var app = builder.Build();

app.UseMiddleware<ExceptionHandlingMiddleware>();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}
app.UseCors("police1");

app.UseHttpsRedirection();


app.UseAuthorization();

app.UseStaticFiles();

app.MapControllers();

app.Run();
