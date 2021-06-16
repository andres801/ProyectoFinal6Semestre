using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace appASPBanco.Models
{
    [Table("tipoProducto")]
    public class tipoProducto
    {
        [Key]
        public Int32 idTipoProducto { get; set; }
        public string nombreTipoProducto { get; set; }
        public Boolean estatus { get; set; }
    }
}