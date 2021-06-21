using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace coderush.Controllers
{
    [Authorize(Roles = Pages.MainMenu.Turno.RoleName)]
    public class TurnoController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
