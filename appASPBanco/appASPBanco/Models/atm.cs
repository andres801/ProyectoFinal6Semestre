using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace appASPBanco.Models
{
    [Table("atm")]
    public class atm
    {
        [Key]
        public Int32 idAtm { get; set; }
        public string codigoAtm { get; set; }
        public DateTime fechaUltimoMantenimiento { get; set; }
        public Decimal dinero { get; set; }
        public Int32 idSucursal { get; set; }
        public Boolean estatus { get; set; }
    }
}