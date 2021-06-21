using Capa.Conexion.Models;
using Capa.Service.Servicio;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

namespace Capa.Repository.Repositorio
{
    /// <summary>
    /// Crud para la tabla Alumno
    /// </summary>
    public class AlumnoRepository : IAlumno
    {
        #region Atributos
        AsesoftwareContext asesoftware = new AsesoftwareContext();
        private TextReader reader;
        private bool disposed = false; //Para detectar llamadas redundantes
        #endregion

        #region Atributos

        /// <summary>
        /// Motodo agregar
        /// </summary>
        /// <param name="entity">Parametro Clase Alumno</param>
        public void add(Alumno entity)
        {
            asesoftware.Alumno.Add(entity);
            asesoftware.SaveChanges();
        }
        /// <summary>
        /// Eliminar dato de la tabla Alumno
        /// </summary>
        /// <param name="id">Paramatro llave principal Id</param>
        public void delete(int id)
        {
            Alumno alumno = asesoftware.Alumno.Find(id);
            asesoftware.Alumno.Remove(alumno);
            asesoftware.SaveChanges();
        }
        /// <summary>
        /// Metedo liberacion Memoria
        /// </summary>
        public void Dispose()
        {
            // Elimine los recursos no administrados.
            Dispose(true);
            // Suppress finalization.
            GC.SuppressFinalize(this);
        }
        /// <summary>
        /// finalizacion del evento
        /// </summary>
        /// <param name="disposing">Entra inicial booleano</param>
        public void Dispose(bool disposing)
        {
            if (!disposed)
            {
                if (disposing)
                {
                    if (reader != null)
                    {
                        reader.Dispose();
                    }
                }

                disposed = true;
            }
        }

        /// <summary>
        /// Muestra todos los datos de la tabla
        /// </summary>
        /// <returns>Valores a mostrar</returns>
        public IEnumerable<Alumno> getAll()
        {
            using (var context = new AsesoftwareContext())
            {
                var data = context.Alumno.ToList(); // Return the list of data from the database
                return data;
            }
        }
        /// <summary>
        /// Metodo buscar por grado
        /// </summary>
        /// <param name="id">Parametro para buscar</param>
        /// <returns></returns>
        public Alumno getById(int id)
        {
            Alumno alumno = asesoftware.Alumno
                .Where(x => x.Id == id)
                .FirstOrDefault();
            return alumno;
        }
        /// <summary>
        /// Modificar
        /// </summary>
        /// <param name="entity">Parametro</param>
        public void modify(Alumno entity)
        {
            asesoftware.Entry(entity).State = EntityState.Modified;
            asesoftware.SaveChanges();
        }
        #endregion
    
    }
}
