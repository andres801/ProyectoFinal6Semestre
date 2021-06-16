using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace appASPBanco.Models
{
    [Table("movimiento")]
    public class movimiento
    {
        [Key]
        public Int32 idMovimiento { get; set; }
        public Decimal montoMovimiento { get; set; }
        public Int32 idProducto { get; set; }
        public Int32 idAutorizacion { get; set; }
        public Boolean estatus { get; set; }
    }
}