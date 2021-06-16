using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace appASPBanco.Models
{
    [Table("empleado")]
    public class empleado
    {
        [Key]
        public Int32 idEmpleado { get; set; }
        public string nombreEmpleado { get; set; }
        public Int32 idSucursal { get; set; }
        public Int32 idPuesto { get; set; }
        public Boolean estatus { get; set; }
    }
}