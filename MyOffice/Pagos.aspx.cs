using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;



namespace MyOffice
{
    public partial class Pagos : System.Web.UI.Page
    {
        SqlConnection cn = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\CACHUREO\\tp4 c# proyectos\\proyecto myoffice belen\\MyOffice\\MyOffice\\App_Data\\Pagos.mdf;Integrated Security=True");
        SqlCommand cmd = new SqlCommand();
        SqlDataReader dr;

        protected void Page_Load(object sender, EventArgs e)
        {
            cmd.Connection = cn;
            cn.Open();
            if (!IsPostBack)
            {
                cmd.CommandText = "select codigo from articulo";
                dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        ddlArticulos.Items.Add(dr[0].ToString());
                    }
                    dr.Close();
                }
                cmd.CommandText = "select rut from cliente";
                dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        ddlClientes.Items.Add(dr[0].ToString());
                        ddlRut.Items.Add(dr[0].ToString());
                    }
                    dr.Close();
                }
            }           
            cn.Close();

        }

        protected void txtNombreMostrar_TextChanged(object sender, EventArgs e)
        {

        }

        protected void IngresarPago(object sender, EventArgs e)
        {
            cn.Open();
            try
            {
                if (txtCantidad.Text.Length != 0 && int.Parse(txtCantidad.Text) > 0)
                {
                    int i = 0;
                    string fecha = (DateTime.Today.Month + "/" + DateTime.Today.Day + "/" + DateTime.Today.Year).ToString();
                    cmd.CommandText = "INSERT INTO PAGO VALUES (" + ddlClientes.SelectedValue + ", " + ddlArticulos.SelectedValue + ", '" + fecha + "', " + txtCantidad.Text + ")";
                    i = cmd.ExecuteNonQuery();
                    if (i != 0)
                    {
                        ActualizarStock(txtCantidad.Text, ddlArticulos.SelectedValue);
                        lbMostrar.Text = "Registro Insertado con éxito";
                    }
                }
                else
                {
                    lbMostrar.Text = "debe ingresar datos validos";
                }
            }
            catch (Exception)
            {
                lbMostrar.Text = "Debe ingresar datos validos";  
            }
            ddlRut.Items.Clear();
            CargarRutPagos();
            cn.Close();
        }

        protected void ActualizarPagos(object sender, EventArgs e)
        {
            lstPagos.Items.Clear();
            cn.Open();
            if (ddlRut.SelectedValue == "Todos")
            {
                string comando = "Select cliente.rut, cliente.nombre, cliente.apellido, pago.rut_cliente, pago.fecha, pago.cantidad, pago.codigo_articulo, articulo.codigo, articulo.nombre ";
                cmd.CommandText = comando+ " from cliente join pago on cliente.rut = pago.rut_cliente join articulo on pago.codigo_articulo= articulo.codigo";
                dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        lbNombre.Text = ""; 
                        DateTime fecha = DateTime.Parse(dr[4].ToString());
                        lstPagos.Items.Add(fecha.ToString("d") + " - " + dr[1].ToString() +" "+dr[2].ToString() + " - " + dr[8].ToString() +" - "+dr[5].ToString());
                    }
                    dr.Close();
                }

            }
            else
            {
                string comando = "Select pago.rut_cliente, pago.codigo_articulo, pago.fecha, pago.cantidad, cliente.nombre, cliente.apellido, cliente.rut, articulo.nombre, articulo.codigo ";
                cmd.CommandText = comando + "from cliente join pago on  cliente.rut = pago.rut_cliente join Articulo on pago.codigo_articulo = articulo.codigo where rut_cliente =" + ddlRut.SelectedValue +"";
                dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        lbNombre.Text = dr[4].ToString() +"  "+ dr[5].ToString();
                        DateTime fecha = DateTime.Parse(dr[2].ToString());
                        lstPagos.Items.Add(fecha.ToString("d") + " - " + dr[0].ToString() + " - " + dr[7].ToString() + " - " + dr[3].ToString());
                    }
                    dr.Close();
                }

            }
            cn.Close();
        }

        protected void EliminarPagos(object sender, EventArgs e)
        {
            cn.Open();
            cmd.CommandText = "delete from pago where";
            cn.Close();
        }

        protected void Cancelar(object sender, EventArgs e)
        {
            txtCantidad.Text = "";
            txtTotal.Text = "";
        }

        private void ActualizarStock(string vendido, string codigo)
        {
            cmd.CommandText = "select * from articulo where codigo = " + codigo;
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    if (dr.GetInt32(3) >= int.Parse(vendido))
                    {
                        int stockNuevo = dr.GetInt32(3) - int.Parse(vendido);
                        cmd.CommandText = "update articulo set stock =" + stockNuevo + " where codigo =" + codigo;
                        txtTotal.Text = "" + (dr.GetInt32(2) * int.Parse(vendido));
                    }
                    else
                    {
                        lbMostrar.Text = "sobrepasa el maximo!!!(stock: " + dr.GetInt32(3) + ")";
                    }
                }
            }
        }

        private void CargarRutPagos()
        {
            if (!IsPostBack)
            {
                cmd.CommandText = "select rut from cliente";
                dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        ddlRut.Items.Add(dr[0].ToString());
                    }
                    dr.Close();
                }
            }

        }

        protected void SelectDdlArticulo(object sender, EventArgs e)
        {
            cn.Open();
            cmd.CommandText = "select * from articulo where codigo= " + ddlArticulos.Text;
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    lbArticulo.Text = dr[1].ToString();
                    
                }
                dr.Close();

            }
            cn.Close();
        }

        protected void SelectDdlCliente(object sender, EventArgs e)
        {
            cn.Open();
            cmd.CommandText = "select * from cliente where rut= " + ddlClientes.Text;
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    lbCliente.Text = dr[1].ToString() + " "+ dr[2].ToString();

                }
                dr.Close();

            }
            cn.Close();
        }

        protected void MostrarPagos(object sender, EventArgs e)
        {

        }
    }
}