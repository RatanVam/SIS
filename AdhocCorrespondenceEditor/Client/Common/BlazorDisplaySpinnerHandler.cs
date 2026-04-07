using System.Net.Http;
using System.Threading;
using System.Threading.Tasks;

namespace AdhocCorrespondenceEditor.Client.Common
{
    public class BlazorDisplaySpinnerHandler : DelegatingHandler
    {
        private readonly SpinnerService _spinnerService;
        public BlazorDisplaySpinnerHandler(SpinnerService spinnerService)
        {
            _spinnerService = spinnerService;
        }
        protected override async Task<HttpResponseMessage> SendAsync(HttpRequestMessage request, CancellationToken cancellationToken)
        {
            _spinnerService.Show();
            await Task.Delay(300);
            var response = await base.SendAsync(request, cancellationToken);
            _spinnerService.Hide();
            return response;
        }


        public void Show ()
        {
            _spinnerService.Show();
        }

        public async void Stop(int millseconds = 200)
        {
            await Task.Delay(millseconds);
            _spinnerService.Hide();
        }
    }
}
