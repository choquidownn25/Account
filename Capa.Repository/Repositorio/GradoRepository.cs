using Capa.Conexion.Models;
using Capa.Domain.Dominio;
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
    /// Crud para la tabla Grado
    /// </summary>
    public class GradoRepository : IGrado //contrato para la logica de negocio
    {
        #region Atributos
        AsesoftwareContext asesoftware = new AsesoftwareContext();
        private TextReader reader;
        private bool disposed = false; //Para detectar llamadas redundantes
        #endregion
        #region Metodos para realizar el crud

        /// <summary>
        /// Metodo para guardar los grados
        /// </summary>
        /// <param name="entity">Parametro Clase Grado</param>
        public void add(Grado entity)
        {
            asesoftware.Grado.Add(entity);
            asesoftware.SaveChanges();
        }

        /// <summary>
        /// Eliminar dato de la tabla Grados
        /// </summary>
        /// <param name="id">Paramatro llave principal Id</param>
        public void delete(int id)
        {
            Grado grado = asesoftware.Grado.Find(id);
            asesoftware.Grado.Remove(grado);
            asesoftware.SaveChanges();
        }

        /// <summary>
        /// Metedo liberacion Memoria
        /// </summary>
        public  void Dispose()
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
        /// Busca todos los grados
        /// </summary>
        /// <returns>Retorna todos lo grados</returns>
        public IEnumerable<Grado> getAll()
        {
            using (var context = new AsesoftwareContext())
            {
                var data = context.Grado.ToList(); // Return the list of data from the database
                return data;
            }
        }
        /// <summary>
        /// Metodo buscar por grado
        /// </summary>
        /// <param name="id">Parametro para buscar</param>
        /// <returns></returns>
        public Grado getById(int id)
        {
            Grado grado = asesoftware.Grado
                .Where(x => x.Id == id)
                .FirstOrDefault();
            return grado;
        }
        /// <summary>
        /// Modificar
        /// </summary>
        /// <param name="entity">Parametro</param>
        public void modify(Grado entity)
        {
            asesoftware.Entry(entity).State = EntityState.Modified;
            asesoftware.SaveChanges();
        }

        #endregion
    }
}
