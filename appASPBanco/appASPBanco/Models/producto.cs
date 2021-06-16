using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace appASPBanco.Models
{
    [Table("producto")]
    public class producto
    {
        [Key]
        public Int32 idProducto { get; set; }
        public string codigoProducto { get; set; }
        public Int32 idTipoProducto { get; set; }
        public Int32 idSucursal { get; set; }
        public Boolean estatus { get; set; }
    }
}