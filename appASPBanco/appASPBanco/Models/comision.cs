using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace appASPBanco.Models
{
    [Table("comision")]
    public class comision
    {
        [Key]
        public Int32 idComision { get; set; }
        public string nombreComision { get; set; }
        public Decimal montoComision { get; set; }
        public Boolean estatus { get; set; }
    }
}