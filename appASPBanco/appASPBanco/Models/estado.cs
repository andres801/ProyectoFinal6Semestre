using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace appASPBanco.Models
{
    [Table("estado")]
    public class estado
    {
        [Key]
        public Int32 idEstado { get; set; }
        public string nombreEstado { get; set; }
        public Boolean estatus { get; set; }
    }
}