using System;
using System.Collections.Generic;

namespace Capa.Conexion.Models
{
    public partial class Turno
    {
        public int IdTurno { get; set; }
        public int IdServicio { get; set; }
        public DateTime FechaTurna { get; set; }
        public TimeSpan HoraInicio { get; set; }
        public TimeSpan HoraFin { get; set; }
        public bool Estado { get; set; }

        public virtual Services IdServicioNavigation { get; set; }
    }
}
