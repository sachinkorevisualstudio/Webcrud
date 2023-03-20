using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Webcrud.Startup))]
namespace Webcrud
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
