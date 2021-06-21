using System;
using System.Collections.Generic;

namespace Capa.Conexion.Models
{
    public partial class Nota
    {
        public Nota()
        {
            Alumno = new HashSet<Alumno>();
        }

        public int Id { get; set; }
        public int Codigo { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }
        public bool Activo { get; set; }

        public virtual ICollection<Alumno> Alumno { get; set; }
    }
}
