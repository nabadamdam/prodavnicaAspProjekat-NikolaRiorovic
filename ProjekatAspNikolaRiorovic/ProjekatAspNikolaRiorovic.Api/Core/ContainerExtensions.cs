using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.IdentityModel.Tokens;
using Newtonsoft.Json;
using ProjekatAspNikolaRiorovic.Application;
using ProjekatAspNikolaRiorovic.Application.Commands;
using ProjekatAspNikolaRiorovic.Application.Email;
using ProjekatAspNikolaRiorovic.Application.Queries;
using ProjekatAspNikolaRiorovic.Implementation.Commands;
using ProjekatAspNikolaRiorovic.Implementation.Email;
using ProjekatAspNikolaRiorovic.Implementation.Logging;
using ProjekatAspNikolaRiorovic.Implementation.Queries;
using ProjekatAspNikolaRiorovic.Implementation.Validators;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjekatAspNikolaRiorovic.Api.Core
{
    public static class ContainerExtensions
    {
        public static void AddUseCases(this IServiceCollection services) 
        {
            services.AddTransient<ICreateKorisnikCommand, EfCreateKorisnik>();
            services.AddTransient<IDeleteKorisnikCommand, EfDeleteKorisnik>();
            services.AddTransient<ICreateProizvodCommand, EfCreateProizvod>();
            services.AddTransient<ICreateUlogaCommand, EfCreateUloga>(); 
            services.AddTransient<ICreateKategorijaCommand, EfCreateKategorija>(); 
            services.AddTransient<ICreateSlikaCommand, EfCreateSlika>();
            services.AddTransient<ICreatePravljenjePorudzbineCommand, EfCreatePravljenjePorudzbine>();
            services.AddTransient<IChangeStatusPorudzbineCommand, EfPromenaStatusa>();
            services.AddTransient<IGetProizvodQuery, EfGetProizvodQuery>();
            services.AddTransient<IGetPorudzbinaQuery, EfGetPorudzbinaQuery>();
            services.AddTransient<IGetKorisnikQuery, EfGetKorisnikQuery>();
            services.AddTransient<IUseCaseLogger, DatabaseUseCaseLogger>();
            services.AddTransient<IGetUseCase, EfGetUseCase>();
            services.AddTransient<IUpdateKorisnikCommand, EfUpdateKorisnikCommand>();
            services.AddTransient<IGetOneKorisnikQuery, EfGetOneKorisnikQuery>();
            services.AddTransient<IEmailSender, SmtpEmailSender>();
            services.AddTransient<IGetUlogaQuery, EfGetUlogaQuery>(); 
            services.AddTransient<IDeleteUlogaCommand, EfDeleteUloga>();
            services.AddTransient<IGetOneUlogaQuery, EfGetOneUlogaQuery>(); 
            services.AddTransient<IUpdateUlogaCommand, EfUpdateUloga>(); 
            services.AddTransient<IGetKategorijaQuery, EfGetAllKategorijeQuery>();
            services.AddTransient<IGetOneKategorijaQuery, EfGetOneKategorijaQuery>();
            services.AddTransient<IDeleteKategorijaCommand, EfDeleteKategorija>(); 
            services.AddTransient<IUpdateKategorijaCommand, EfUpdateKategorija>(); 
            services.AddTransient<IGetOnePorudzbinaQuery, EfGetOnePorudzbinaQuery>();
            services.AddTransient<IDeleteProizvodCommand, EfDeleteProizvod>();
            services.AddTransient<IGetOneProizvodQuery, EfGetOneProizvodQuery>();
            services.AddTransient<IUpdateProizvodCommand, EfUpdateProizvod>();
            services.AddTransient<IGetAllPicForOneProduct,EfGetAllPictureForOneProductQuery>();
            services.AddTransient<IDeletePictureProductCommand, EfDeletePicturesForProduct>();

            services.AddTransient<CreateKorisnikValidator>();
            services.AddTransient<CreateSlikaValidator>();
            services.AddTransient<CreatePravljenjePorudzbineValidator>();
            services.AddTransient<UpdateKorisnikValidator>();
            services.AddTransient<CreateDetaljiPorudzbineValidator>();
            services.AddTransient<CreateKategorijaValidator>();
            services.AddTransient<CreateProizvodValidator>();
            services.AddTransient<CreateUlogaValidator>(); 
            services.AddTransient<UlogaIdValidator>();
            services.AddTransient<EmailValidatorUnique>();
            services.AddTransient<UpdateProizvodValidator>();
            services.AddTransient<ProizvodNazivValidator>();
        }
        public static void AddAppActor(this IServiceCollection services) {
            services.AddTransient<IActorInApp>(x =>
            {
                var accessor = x.GetService<IHttpContextAccessor>();
                //izvuci token
                //pozicionirati se na payload
                //izvuci ActorData claim
                //Deserijalizovati actorData string u c# objekat

                var user = accessor.HttpContext.User;

                if (user.FindFirst("ActorData") == null)
                {
                    return new UnAuthorizedActor();
                }

                var actorString = user.FindFirst("ActorData").Value;

                var actor = JsonConvert.DeserializeObject<JwtActor>(actorString);

                return actor;

            });
        }
        public static void AddJwt(this IServiceCollection services)
        {
            services.AddAuthentication(options =>
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
                    ValidIssuer = "asp_api",
                    ValidateIssuer = true,
                    ValidAudience = "Any",
                    ValidateAudience = true,
                    IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes("ThisIsMyVerySecretKey")),
                    ValidateIssuerSigningKey = true,
                    ValidateLifetime = true,
                    ClockSkew = TimeSpan.Zero
                };
            });


        }
    }
}
