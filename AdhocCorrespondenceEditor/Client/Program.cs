using AdhocCorrespondenceEditor.Client;
using AdhocCorrespondenceEditor.Client.Common;
using Microsoft.AspNetCore.Components;
using Microsoft.AspNetCore.Components.Web;
using Microsoft.AspNetCore.Components.WebAssembly.Hosting;
using Microsoft.Extensions.DependencyInjection;
using Radzen;
var builder = WebAssemblyHostBuilder.CreateDefault(args);
builder.RootComponents.Add<App>("#app");
builder.RootComponents.Add<HeadOutlet>("head::after");
builder.Services.AddScoped(sp => new HttpClient { BaseAddress = new Uri(builder.HostEnvironment.BaseAddress), Timeout = new TimeSpan(0, 2, 0) });
builder.Services.AddScoped<SpinnerService>();
builder.Services.AddScoped<BlazorDisplaySpinnerHandler>();
builder.Services.AddScoped<DialogService>();
builder.Services.AddScoped<NotificationService>();
builder.Services.AddScoped<TooltipService>();
builder.Services.AddSingleton<StateContainer>();

await builder.Build().RunAsync();
