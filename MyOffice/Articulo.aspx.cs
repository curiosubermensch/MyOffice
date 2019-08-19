using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace MyOffice
{
    public partial class Articulo : System.Web.UI.Page
    {
        SqlConnection cn = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\CACHUREO\\tp4 c# proyectos\\proyecto myoffice belen\\MyOffice\\MyOffice\\App_Data\\Pagos.mdf;Integrated Security=True");
        SqlCommand cmd = new SqlCommand();
        SqlDataReader dr;

        protected void Page_Load(object sender, EventArgs e)
        {
            cmd.Connection = cn;
            if (!IsPostBack)
            {
                cn.Open();
                cmd.CommandText = "select codigo from articulo";
                dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        ddlCodigos.Items.Add(dr[0].ToString());
                    }
                    dr.Close();
                    cn.Close();
                }
            }
        }
        protected void Ingresar(object sender, EventArgs e)
        {

            try
            {
                if (txtNombre.Text.Length != 0 || txtPrecio.Text.Length != 0 || txtCantidad.Text.Length != 0 || int.Parse(txtPrecio.Text) > 0)
                {
                    cn.Open();
                    int i = 0;
                    cmd.CommandText = "INSERT INTO ARTICULO VALUES (" + txtCodigo.Text + ", '" + txtNombre.Text + "', " + txtPrecio.Text + ", " + txtCantidad.Text + ")";
                    i = cmd.ExecuteNonQuery();
                    if (i != 0)
                    {
                        lbMostrar.Text = "Registro Insertado con éxito";
                    }
                }
                else
                {
                    lbMostrar.Text = "Ingrese un Dato Valido";
                }

            }
            catch (Exception)
            {

                lbMostrar.Text = "El articulo ya ha sido ingresado";
            }
            ddlCodigos.Items.Clear();
            volveracargar();
            cn.Close();
        }
        protected void Eliminar(object sender, EventArgs e)
        {

            cn.Open();
            int i = 0;
            cmd.CommandText = "delete from articulo where codigo=" + ddlCodigos.Text;
            i = cmd.ExecuteNonQuery();
            if (i != 0)
            {
                lbMostrar.Text = "Eliminado correctamente";
            }
            ddlCodigos.Items.Clear();
            volveracargar();
            cn.Close();
            txtNombreMostrar.Text = "";
            txtPrecioM.Text = "";
            txtCantidadM.Text = "";

        }
        protected void Actualizar(object sender, EventArgs e)
        {
            try
            {
                cn.Open();
                int i = 0;
                if (txtNombreMostrar.Text.Length != 0 || txtPrecioM.Text.Length != 0 || txtCantidadM.Text.Length != 0 || int.Parse(txtPrecioM.Text) > 0)
                {

                    cmd.CommandText = "update articulo set nombre='" + txtNombreMostrar.Text + "', precio=" + txtPrecioM.Text + ", stock=" + txtCantidadM.Text + " where codigo=" + ddlCodigos.SelectedValue;
                    i = cmd.ExecuteNonQuery();
                    if (i != 0)
                    {
                        lbMostrar.Text = "Registro actualizado";
                    }
                }
                else
                {
                    lbMostrar.Text = "Debe ingresar datos Validos";
                }

            }
            catch (Exception)
            {

                lbMostrar.Text = "Debe seleccionar un codigo";
            }
            cn.Close();
        }

        protected void ddlCodigoSelected(object sender, EventArgs e)
        {
            cn.Open();
            cmd.CommandText = "select * from articulo where codigo= " + ddlCodigos.Text;
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    txtNombreMostrar.Text = dr[1].ToString();
                    txtPrecioM.Text = dr[2].ToString();
                    txtCantidadM.Text = dr[3].ToString();
                }
                dr.Close();

            }
            cn.Close();
        }
        private void volveracargar()
        {

            cmd.CommandText = "select codigo from articulo";
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    ddlCodigos.Items.Add(dr[0].ToString());
                }
            }
            dr.Close();

        }

        protected void btCancelar_Click(object sender, EventArgs e)
        {
            txtCodigo.Text = "";
            txtNombre.Text = "";
            txtPrecio.Text = "";
            txtCantidad.Text = "";
        }
    }
}