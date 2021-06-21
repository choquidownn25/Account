using Capa.Conexion.Models;
using Capa.Service.Servicio;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

namespace Capa.Repository.Repositorio
{
    public class ServicesRepository : IServices
    {
        AsesoftwareContext asesoftwareContext = new AsesoftwareContext();
        private TextReader reader;
        private bool disposed = false; //Para detectar llamadas redundantes
        public void add(Services entity)
        {
            asesoftwareContext.Add(entity);
            asesoftwareContext.SaveChanges();
        }

        public void delete(int id)
        {
            Services services = asesoftwareContext.Services.Find(id);
            asesoftwareContext.Services.Remove(services);
            asesoftwareContext.SaveChanges();
        }
                
        public IEnumerable<Services> getAll()
        {
            throw new NotImplementedException();
        }

        public Services getById(int id)
        {
            Services services = asesoftwareContext.Services
                                .Where(x => x.IdServicios == id)
                                .FirstOrDefault();
            return services;
        }

        public void modify(Services entity)
        {
            Services services = entity;
            asesoftwareContext.Services.Update(services);
            asesoftwareContext.SaveChanges();
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



    }
}
