using CineBack.dominio;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CineBack.acceso_a_datos
{
    class ComprobanteDao : IComprobanteDao
    {

        //MOSTRAR COMPROBANTES
        public List<Comprobante> GetComprobantes()
        {
            List<Comprobante> comprobantes = new List<Comprobante>();

            string sp = "SP_CONSULTAR_COMPROBANTES";
            DataTable t = HelperDao.ObtenerInstancia().ConsultaSQL(sp, null);

            foreach (DataRow dr in t.Rows)
            {
                Comprobante aux = new Comprobante();
                aux.IdComprobante = int.Parse(dr["id_comprobante"].ToString());
                aux.IdCliente = int.Parse(dr["id_cliente"].ToString());
                aux.IdFormaPago = int.Parse(dr["id_forma_pago"].ToString());
                aux.IdFormaCompra = int.Parse(dr["id_forma_compra"].ToString());
                aux.Fecha = DateTime.Parse(dr["fecha"].ToString());
                aux.IdEstado = int.Parse(dr["id_estado"].ToString());

                comprobantes.Add(aux);
            }
            return comprobantes;
        }


        //CREAR COMPROBANTES
        public bool Crear(Comprobante oComprobante)
        {
            bool ok = true;
            SqlConnection cnn = HelperDao.ObtenerInstancia().ObtenerConexion();
            SqlTransaction t = null;
            SqlCommand cmd = new SqlCommand();
            try
            {
                cnn.Open();
                t = cnn.BeginTransaction();
                cmd.Connection = cnn;
                cmd.Transaction = t;
                cmd.CommandText = "SP_INSERTAR_MAESTRO";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@idCliente", oComprobante.IdCliente);
                cmd.Parameters.AddWithValue("@idFormaPago", oComprobante.IdFormaPago);
                cmd.Parameters.AddWithValue("@idFormaCompra", oComprobante.IdFormaCompra);
                cmd.Parameters.AddWithValue("@total", oComprobante.CalcularTotal());

                //parámetro de salida:
                SqlParameter pOut = new SqlParameter();
                pOut.ParameterName = "@comprobante_nro";
                pOut.DbType = DbType.Int32;
                pOut.Direction = ParameterDirection.Output;
                cmd.Parameters.Add(pOut);
                cmd.ExecuteNonQuery();

                int comprobanteNro = (int)pOut.Value;

                SqlCommand cmdDetalle;

                foreach (DetalleComprobante item in oComprobante.Detalles)
                {
                    cmdDetalle = new SqlCommand("SP_INSERTAR_DETALLE", cnn, t);
                    cmdDetalle.CommandType = CommandType.StoredProcedure;
                    cmdDetalle.Parameters.AddWithValue("@idComprobante", comprobanteNro);
                    cmdDetalle.Parameters.AddWithValue("@idFuncion", item.Funcion.IdFuncion);
                    cmdDetalle.Parameters.AddWithValue("@cantidad", item.Cantidad);
                    cmdDetalle.ExecuteNonQuery();
                }
                t.Commit();
            }

            catch (Exception)
            {
                if (t != null)
                    t.Rollback();
                ok = false;
            }

            finally
            {
                if (cnn != null && cnn.State == ConnectionState.Open)
                    cnn.Close();
            }
            return ok;
        }


        //ACTUALIZAR COMPROBANTE
        public bool Actualizar(Comprobante oComprobante)
        {
            bool ok = true;
            SqlConnection cnn = HelperDao.ObtenerInstancia().ObtenerConexion();
            SqlTransaction t = null;
            SqlCommand cmd = new SqlCommand();

            try
            {
                cnn.Open();
                t = cnn.BeginTransaction();
                cmd.Connection = cnn;
                cmd.Transaction = t;
                cmd.CommandText = "SP_MODIFICAR_MAESTRO";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@idCliente", oComprobante.IdCliente);
                cmd.Parameters.AddWithValue("@idFormaPago", oComprobante.IdFormaPago);
                cmd.Parameters.AddWithValue("@idFormaCompra", oComprobante.IdFormaCompra);
                cmd.Parameters.AddWithValue("@total", oComprobante.CalcularTotal());
                cmd.Parameters.AddWithValue("@comprobante_nro", oComprobante.IdComprobante);
                cmd.ExecuteNonQuery();

                SqlCommand cmdDetalle;

                foreach (DetalleComprobante item in oComprobante.Detalles)
                {
                    cmdDetalle = new SqlCommand("SP_INSERTAR_DETALLE", cnn, t);
                    cmdDetalle.CommandType = CommandType.StoredProcedure;
                    cmdDetalle.Parameters.AddWithValue("@idComprobante", oComprobante.IdComprobante);
                    cmdDetalle.Parameters.AddWithValue("@idFuncion", item.Funcion.IdFuncion);
                    cmdDetalle.Parameters.AddWithValue("@cantidad", item.Cantidad);
                    cmdDetalle.ExecuteNonQuery();
                }
                t.Commit();
            }
            catch (Exception)
            {
                if (t != null)
                    t.Rollback();
                ok = false;
            }
            finally
            {
                if (cnn != null && cnn.State == ConnectionState.Open)
                    cnn.Close();
            }
            return ok;
        }


        //BORRAR COMPROBANTES
        public bool Borrar(int nro)
        {
            string sp = "SP_BORRAR_COMPROBANTE";
            List<Parametro> lst = new List<Parametro>();
            lst.Add(new Parametro("@comprobante_nro", nro));
            int afectadas = HelperDao.ObtenerInstancia().EjecutarSQL(sp, lst);
            return afectadas > 0;
        }
    }
}
