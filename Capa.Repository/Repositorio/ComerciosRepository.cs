using Capa.Conexion.Models;
using Capa.Service.Servicio;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

namespace Capa.Repository.Repositorio
{
    public class ComerciosRepository : IComercios
    {
        AsesoftwareContext asesoftware = new AsesoftwareContext();
        private TextReader reader;
        private bool disposed = false; //Para detectar llamadas redundantes
        public void add(Comercios entity)
        {
            asesoftware.Comercios.Add(entity);
            asesoftware.SaveChanges();
        }

        public void delete(int id)
        {
            Comercios turno = asesoftware.Comercios.Find(id);
            asesoftware.Comercios.Remove(turno);
            asesoftware.SaveChanges();
        }

      
        public IEnumerable<Comercios> getAll()
        {
            throw new NotImplementedException();
        }

        public Comercios getById(int id)
        {

            Comercios comercios = asesoftware.Comercios
                .Where(x => x.IdComercio == id)
                .FirstOrDefault();
            return comercios;
        }

        public void modify(Comercios entity)
        {
            Comercios comercios = entity;
            asesoftware.Comercios.Update(comercios);
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


    }
}
