using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace appASPBanco.Models
{
    [Table("cliente")]
    public class cliente
    {
        [Key]
        public Int32 idCliente { get; set; }
        public string nombreCliente { get; set; }
        public DateTime fechaNacimiento { get; set; }
        public string direccionCliente { get; set; }
        public int idCiudad { get; set; }
        public Boolean estatus { get; set; }

    }
}