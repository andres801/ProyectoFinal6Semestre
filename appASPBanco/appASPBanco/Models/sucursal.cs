using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace appASPBanco.Models
{
    [Table("sucursal")]
    public class sucursal
    {
        [Key]
        public Int32 idSucursal { get; set; }
        public string nombreSucursal { get; set; }
        public string direccionSucursal { get; set; }
        public Int32 idCiudad { get; set; }
        public Boolean estatus { get; set; }
    }
}