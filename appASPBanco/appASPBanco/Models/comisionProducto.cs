using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace appASPBanco.Models
{
    [Table("comisionProducto")]
    public class comisionProducto
    {
        [Key]
        public Int32 idComisionProducto { get; set; }
        public Int32 idComision { get; set; }
        public Int32 idProducto { get; set; }
        public Boolean estatus { get; set; }
    }
}