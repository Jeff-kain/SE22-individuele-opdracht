using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Animelist.Startup))]
namespace Animelist
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
