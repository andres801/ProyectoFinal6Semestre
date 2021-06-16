using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace appASPBanco.Models
{
    [Table("clienteProducto")]
    public class clienteProducto
    {
        [Key]
        public Int32 idClienteProducto { get; set; }
        public Int32 idCliente { get; set; }
        public Int32 idProducto { get; set; }
        public Boolean estatus { get; set; }
    }
}