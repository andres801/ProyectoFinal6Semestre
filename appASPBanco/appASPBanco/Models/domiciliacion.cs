using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace appASPBanco.Models
{
    [Table("domiciliacion")]
    public class domiciliacion
    {
        [Key]
        public Int32 idDomiciliacion { get; set; }
        public string descripcionDomiciliacion { get; set; }
        public Decimal montoDomiciliacion { get; set; }
        public Int32 idServicio { get; set; }
        public Int32 idProducto { get; set; }
        public Boolean estatus { get; set; }
    }
}