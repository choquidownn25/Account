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
    public class TurnoRepository : ITurno
    {
        AsesoftwareContext asesoftware = new AsesoftwareContext();
        private TextReader reader;
        private bool disposed = false; //Para detectar llamadas redundantes

        public void add(Turno entity)
        {
            asesoftware.Turno.Add(entity);
            asesoftware.SaveChanges();
        }

        public void delete(int id)
        {
            Turno turno = asesoftware.Turno.Find(id);
            asesoftware.Turno.Remove(turno);
            asesoftware.SaveChanges();
        }

        public void Dispose()
        {
            // Elimine los recursos no administrados.
            Dispose(true);
            // Suppress finalization.
            GC.SuppressFinalize(this);
        }

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

        public IEnumerable<Turno> getAll()
        {
            using (var context = new AsesoftwareContext())
            {
                var data = context.Turno.ToList(); // Return the list of data from the database
                return data;
            }
        }

        public Turno getById(int id)
        {

            Turno turno = asesoftware.Turno
                .Where(x => x.IdTurno == id)
                .FirstOrDefault();
            return turno;
        }

        public void modify(Turno entity)
        {
            asesoftware.Entry(entity).State = EntityState.Modified;
            asesoftware.SaveChanges();
        }
    }
}
