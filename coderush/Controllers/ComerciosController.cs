
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace coderush.Controllers
{
    [Authorize(Roles = Pages.MainMenu.Comercios.RoleName)]
    public class ComerciosController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
