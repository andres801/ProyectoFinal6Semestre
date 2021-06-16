using System.Data.Entity;

namespace appASPBanco.Models
{
    public class Banco : DbContext
    {
        public DbSet<atm> atm
        {
            get; set;
        }

        public DbSet<autorizacion> autorizacion
        {
            get; set;
        }

        public System.Data.Entity.DbSet<appASPBanco.Models.ciudad> ciudad { get; set; }

        public System.Data.Entity.DbSet<appASPBanco.Models.cliente> cliente { get; set; }

        public System.Data.Entity.DbSet<appASPBanco.Models.clienteProducto> clienteProducto { get; set; }

        public System.Data.Entity.DbSet<appASPBanco.Models.comision> comision { get; set; }

        public System.Data.Entity.DbSet<appASPBanco.Models.comisionProducto> comisionProducto { get; set; }

        public System.Data.Entity.DbSet<appASPBanco.Models.domiciliacion> domiciliacion { get; set; }

        public System.Data.Entity.DbSet<appASPBanco.Models.empleado> empleado { get; set; }

        public System.Data.Entity.DbSet<appASPBanco.Models.estado> estado { get; set; }

        public System.Data.Entity.DbSet<appASPBanco.Models.movimiento> movimiento { get; set; }
        public System.Data.Entity.DbSet<appASPBanco.Models.prestamo> prestamo { get; set; }
        public System.Data.Entity.DbSet<appASPBanco.Models.producto> producto { get; set; }
        public System.Data.Entity.DbSet<appASPBanco.Models.puesto> puesto { get; set; }
        public System.Data.Entity.DbSet<appASPBanco.Models.servicio> servicio { get; set; }
        public System.Data.Entity.DbSet<appASPBanco.Models.sucursal> sucursal { get; set; }
        public System.Data.Entity.DbSet<appASPBanco.Models.tipoProducto> tipoProducto { get; set; }

    }
}