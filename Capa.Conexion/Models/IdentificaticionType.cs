using System;
using System.Collections.Generic;

namespace Capa.Conexion.Models
{
    public partial class IdentificaticionType
    {
        public IdentificaticionType()
        {
            Costumer = new HashSet<Costumer>();
        }

        public int Id { get; set; }
        public int Codigo { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }
        public string Activo { get; set; }

        public virtual ICollection<Costumer> Costumer { get; set; }
    }
}
