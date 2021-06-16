using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace appASPBanco.Models
{
    [Table("servicio")]
    public class servicio
    {
        [Key]
        public Int32 idServicio { get; set; }
        public string descripcionServicio { get; set; }
        public Boolean estatus { get; set; }
    }
}