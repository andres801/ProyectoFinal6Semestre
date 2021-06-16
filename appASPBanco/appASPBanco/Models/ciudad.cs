using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace appASPBanco.Models
{
    [Table("ciudad")]
    public class ciudad
    {
        [Key]
        public Int32 idCiudad { get; set; }
        public string nombreCiudad { get; set; }
        public Int32 idEstado { get; set; }
        public Boolean estatus { get; set; }
    }
}