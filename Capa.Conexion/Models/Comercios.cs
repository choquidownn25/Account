using System;
using System.Collections.Generic;

namespace Capa.Conexion.Models
{
    public partial class Comercios
    {
        public Comercios()
        {
            Services = new HashSet<Services>();
            Servicios = new HashSet<Servicios>();
        }

        public int IdComercio { get; set; }
        public string NomComercio { get; set; }
        public string AfprpMaximo { get; set; }

        public virtual ICollection<Services> Services { get; set; }
        public virtual ICollection<Servicios> Servicios { get; set; }
    }
}
