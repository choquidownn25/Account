using System;
using System.Collections.Generic;

namespace Capa.Conexion.Models
{
    public partial class Costumer
    {
        public int Id { get; set; }
        public int? Numero { get; set; }
        public string PrimerNombre { get; set; }
        public string SegundoNombre { get; set; }
        public string Email { get; set; }
        public string Direccion { get; set; }
        public int? Celular { get; set; }
        public int? IdType { get; set; }

        public virtual IdentificaticionType IdTypeNavigation { get; set; }
    }
}
