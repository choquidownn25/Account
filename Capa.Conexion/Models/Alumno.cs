using System;
using System.Collections.Generic;

namespace Capa.Conexion.Models
{
    public partial class Alumno
    {
        public int Id { get; set; }
        public int Codigo { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public string Direccion { get; set; }
        public string Email { get; set; }
        public int Movil { get; set; }
        public bool Activo { get; set; }
        public int IdNota { get; set; }
        public int IdGrado { get; set; }

        public virtual Grado IdGradoNavigation { get; set; }
        public virtual Nota IdNotaNavigation { get; set; }
    }
}
