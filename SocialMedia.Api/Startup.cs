using AutoMapper;
using FluentValidation.AspNetCore;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.OpenApi.Models;
using SocialMedia.Core.CustomEntities;
using SocialMedia.Core.Interfaces;
using SocialMedia.Core.Services;
using SocialMedia.Infrastructure.Data;
using SocialMedia.Infrastructure.Filters;
using SocialMedia.Infrastructure.Interfaces;
using SocialMedia.Infrastructure.Repositories;
using SocialMedia.Infrastructure.Services;
using System;
using System.IO;
using System.Reflection;

namespace SocialMedia.Api
{
  public class Startup
  {
    public Startup(IConfiguration configuration)
    {
      Configuration = configuration;
    }

    public IConfiguration Configuration { get; }

    // This method gets called by the runtime. Use this method to add services to the container.
    public void ConfigureServices(IServiceCollection services)
    {
      services.AddAutoMapper(AppDomain.CurrentDomain.GetAssemblies());

      services.AddControllers(options =>
      {
        options.Filters.Add<GlobalExceptionFilter>();
      }).AddNewtonsoftJson(options =>
        options.SerializerSettings.NullValueHandling = Newtonsoft.Json.NullValueHandling.Ignore
      )
      .ConfigureApiBehaviorOptions(options =>
      {
        //options.SuppressModelStateInvalidFilter = true;
      });
      services.Configure<PaginationOptions>(Configuration.GetSection("Pagination"));
      services.AddDbContext<SocialMediaContext>(options => options.UseSqlServer(Configuration.GetConnectionString("SocialMedia")));

      //
      services.AddTransient<IPostService, PostService>();
      services.AddTransient<IUnitOfWork, UnitOfWork>();
      services.AddSingleton<IUriService>(provider =>
      {
        var accesor = provider.GetRequiredService<IHttpContextAccessor>();
        var request = accesor.HttpContext.Request;
        var absoluteUri = string.Concat(request.Scheme, "://", request.Host.ToUriComponent());
        return new UriService(absoluteUri);
      });
      //services.AddTransient<IPostRepository, PostRepository>();
      services.AddScoped(typeof(IRepository<>), typeof(BaseRepository<>));

      services.AddSwaggerGen(doc =>
      {
        doc.SwaggerDoc("v1", new OpenApiInfo { Title = "SocialMediaApi", Version = "v1" });

        var xmlfile = $"{Assembly.GetExecutingAssembly().GetName().Name}.xml";
        var xmlPath = Path.Combine(AppContext.BaseDirectory, xmlfile);
        doc.IncludeXmlComments(xmlPath);
      });

      services.AddMvc(//options =>{ options.Filters.Add<ValidationFilter>(); }

      ).AddFluentValidation(options =>
      {
        options.RegisterValidatorsFromAssemblies(AppDomain.CurrentDomain.GetAssemblies());
      }
        );
    }

    // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
    public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
    {
      if (env.IsDevelopment())
      {
        app.UseDeveloperExceptionPage();
      }

      app.UseHttpsRedirection();

      app.UseSwagger();

      app.UseSwaggerUI(options =>
      {
        options.SwaggerEndpoint("/swagger/v1/swagger.json", "Social Media API");
        options.RoutePrefix = string.Empty;
      }
      );

      app.UseRouting();

      app.UseAuthorization();

      app.UseEndpoints(endpoints =>
      {
        endpoints.MapControllers();
      });
    }
  }
}
