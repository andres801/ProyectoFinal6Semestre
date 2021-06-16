using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace appASPBanco.Models
{
    [Table("prestamo")]
    public class prestamo
    {
        [Key]
        public Int32 idPrestamo { get; set; }
        public DateTime fechaPrestamo { get; set; }
        public Decimal cantidadPRestamo { get; set; }
        public Int32 idCliente { get; set; }
        public Boolean estatus { get; set; }
    }
}