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
    /// Crud para la tabla Nota
    /// </summary>
    public class NotaRepository : INota //contrato para la logica de negocio
    {
        #region Atributos
        AsesoftwareContext asesoftware = new AsesoftwareContext();
        private TextReader reader;
        private bool disposed = false; //Para detectar llamadas redundantes
        #endregion

        #region Nota
        /// <summary>
        /// Motodo agregar
        /// </summary>
        /// <param name="entity">Parametro Clase Nota</param>
        public void add(Nota entity)
        {
            asesoftware.Nota.Add(entity);
            asesoftware.SaveChanges();
        }

        /// <summary>
        /// Eliminar dato de la tabla Grados
        /// </summary>
        /// <param name="id">Paramatro llave principal Id</param>
        public void delete(int id)
        {
            Nota nota = asesoftware.Nota.Find(id);
            asesoftware.Nota.Remove(nota);
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
        public IEnumerable<Nota> getAll()
        {
            using(var context = new AsesoftwareContext())
            {
                var data = context.Nota.ToList(); // Return the list of data from the database
                return data;
            }
        }
        /// <summary>
        /// Metodo buscar por grado
        /// </summary>
        /// <param name="id">Parametro para buscar</param>
        /// <returns></returns>
        public Nota getById(int id)
        {
            Nota nota = asesoftware.Nota
                .Where(x => x.Id == id)
                .FirstOrDefault();
            return nota;
        }
        /// <summary>
        /// Modificar
        /// </summary>
        /// <param name="entity">Parametro</param>
        public void modify(Nota entity)
        {
            asesoftware.Entry(entity).State = EntityState.Modified;
            asesoftware.SaveChanges();
        }
        #endregion


    }
}
