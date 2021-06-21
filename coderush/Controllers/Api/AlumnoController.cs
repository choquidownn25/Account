using Capa.Conexion.Models;
using Capa.Repository.Repositorio;
using coderush.Data;
using coderush.Models.SyncfusionViewModels;
using coderush.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Prueba.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace coderush.Controllers.Api
{
    [Authorize]
    [Produces("application/json")]
    [Route("api/Alumno")]
    public class AlumnoController : Controller
    {
        private readonly ApplicationDbContext _context;
        private readonly INumberSequence _numberSequence;
        private readonly AsesoftwareContext asesoftware = new AsesoftwareContext();
        private AlumnoRepository alumnoRepository = new AlumnoRepository();
        /// <summary>
        /// Adquiere permiso de la aplicacion
        /// </summary>
        /// <param name="context">Contexto del rol</param>
        /// <param name="numberSequence">Sequencia</param>
        public AlumnoController(ApplicationDbContext context,
                       INumberSequence numberSequence)
        {
            _context = context;
            _numberSequence = numberSequence;
        }
        public IActionResult Index()
        {
            return View();
        }

        /// <summary>
        /// Metodo para mostrar dastos en la tabla Alumno
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public async Task<IActionResult> GetAlumno()
        {
            List<Alumno> Items = await asesoftware.Alumno.ToListAsync();
            int Count = Items.Count();
            return Ok(new { Items, Count });
        }
        /// <summary>
        /// Metodo de Acccion Insertar
        /// </summary>
        /// <param name="payload"></param>
        /// <returns></returns>
        [HttpPost("[action]")]
        public IActionResult Insert([FromBody] CrudViewModel<AlumnoModels> payload)
        {


            Alumno alumno = payload.value;
            //_pruebaContext.TipoDocumento.Add(TipoDocumento);
            alumnoRepository.add(alumno);
            //_pruebaContext.SaveChanges();
            return Ok(alumno);
        }
        /// <summary>
        /// Metodo de accion Actulizar
        /// </summary>
        /// <param name="payload"></param>
        /// <returns></returns>
        [HttpPost("[action]")]
        public IActionResult Update([FromBody] CrudViewModel<AlumnoModels> payload)
        {
            Alumno alumno = payload.value;
            //_pruebaContext.TipoDocumento.Update(tipoDocumento);
            alumnoRepository.modify(alumno);
            //_pruebaContext.SaveChanges();
            return Ok(alumno);
        }
        /// <summary>
        /// Metodo de accion eliminar
        /// </summary>
        /// <param name="payload"></param>
        /// <returns></returns>
        [HttpPost("[action]")]
        public IActionResult Remove([FromBody] CrudViewModel<AlumnoModels> payload)
        {
            Alumno alumno = payload.value;
            alumnoRepository.delete(alumno.Id);
            return Ok(alumno);

        }
    }
}
