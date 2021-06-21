using System;
using System.Collections.Generic;

namespace Capa.Conexion.Models
{
    public partial class Services
    {
        public Services()
        {
            Turno = new HashSet<Turno>();
        }

        public int IdServicios { get; set; }
        public int IdComercio { get; set; }
        public string NomServicio { get; set; }
        public TimeSpan HoraApertura { get; set; }
        public TimeSpan HoraCierre { get; set; }
        public string Duracion { get; set; }

        public virtual Comercios IdComercioNavigation { get; set; }
        public virtual ICollection<Turno> Turno { get; set; }
    }
}
