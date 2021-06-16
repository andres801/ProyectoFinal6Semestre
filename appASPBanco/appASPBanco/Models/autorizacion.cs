using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace appASPBanco.Models
{
    [Table("autorizacion")]
    public class autorizacion
    {
        [Key]
        public Int32 idAutorizacion { get; set; }
        public string descripcionAutorizacion { get; set; }
        public Boolean estatus { get; set; }
    }
}