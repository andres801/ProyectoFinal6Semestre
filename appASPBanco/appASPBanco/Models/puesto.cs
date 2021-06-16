using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace appASPBanco.Models
{
    [Table("puesto")]
    public class puesto
    {
        [Key]
        public Int32 idPuesto { get; set; }
        public string nombrePuesto { get; set; }
        public Boolean estatus { get; set; }
    }
}