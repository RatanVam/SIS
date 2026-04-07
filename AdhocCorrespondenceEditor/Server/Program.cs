using AdhocCorrespondenceEditor.Repository;
using AdhocCorrespondenceEditor.Utility.Cache;
using AdhocCorrespondenceEditor.Service.Middleware;
using NJM.DotNetLibrary.Security;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllersWithViews();
builder.Services.AddRazorPages();
builder.Services.AddSingleton<ICacheHelper, CacheHelper>();
builder.Services.AddTransient<IACERepository, ACERepository>();
builder.Services.AddHttpClient();

var app = builder.Build();
app.UseMiddleware<ExceptionHandler>();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseWebAssemblyDebugging();
}
else
{
    app.UseExceptionHandler("/Error");
}
app.UseSiteMinderMiddleware();

app.UseBlazorFrameworkFiles();
app.UseStaticFiles();

app.UseRouting();


app.MapRazorPages();
app.MapControllers();
app.MapFallbackToFile("index.html");

app.Run();
