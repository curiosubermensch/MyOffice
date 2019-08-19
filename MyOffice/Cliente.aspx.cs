using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyOffice
{
    public partial class Cliente : System.Web.UI.Page
    {
        SqlConnection cn = new SqlConnection("Data Source = (LocalDB)\\MSSQLLocalDB; AttachDbFilename=C:\\CACHUREO\\tp4 c# proyectos\\proyecto myoffice belen\\MyOffice\\MyOffice\\App_Data\\Pagos.mdf;Integrated Security=True");
        SqlCommand cmd = new SqlCommand();
        SqlDataReader dr;

        protected void Page_Load(object sender, EventArgs e)
        {
            cmd.Connection = cn;
            if (!IsPostBack)
            {
                cn.Open();
                cmd.CommandText = "select rut from cliente";
                dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        ddlRut.Items.Add(dr[0].ToString());
                    }
                    dr.Close();
                    cn.Close();
                }
            }
        }
        protected void IngresarCliente(object sender, EventArgs e)
        {
            cn.Open();

            try
            {
                if (txtNombre.Text.Length != 0 || txtApellido.Text.Length != 0)
                {
                    if (int.Parse(txtRut.Text) <= 99999999)
                    {
                        int i = 0;
                        cmd.CommandText = "INSERT INTO CLIENTE VALUES (" + txtRut.Text + ", '" + txtNombre.Text + "', '" + txtApellido.Text + "')";
                        i = cmd.ExecuteNonQuery();
                        if (i != 0)
                        {
                            lbMostrar.Text = "Registro Insertado con éxito";

                        }
                    }
                    else
                    {
                        lbMostrar.Text = "El rut no debe tener mas de 8 digitos";
                    }
                }

                else
                {
                    lbMostrar.Text = "Debe escribir nombre y apellido";

                }
            }
            catch (Exception)
            {

                lbMostrar.Text = "El Cliente ya esta ingresado";
            }
            ddlRut.Items.Clear();
            volveracargar();
            cn.Close();
        }
        protected void ActualizarCliente(object sender, EventArgs e)
        {
            try
            {
                cn.Open();
                int i = 0;
                if (txtNombreM.Text.Length != 0 || txtApellidoM.Text.Length != 0)
                {
                    cmd.CommandText = "update cliente set nombre='" + txtNombreM.Text + "', apellido='" + txtApellidoM.Text + "' where rut=" + ddlRut.SelectedValue;
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
                lbMostrar.Text = "Debe seleccionar un cliente ";
            }
            cn.Close();
        }
        protected void EliminarCliente(object sender, EventArgs e)
        {

            cn.Open();
            int i = 0;
            cmd.CommandText = "delete from cliente where rut=" + ddlRut.Text;
            i = cmd.ExecuteNonQuery();
            if (i != 0)
            {
                lbMostrar.Text = "Eliminado correctamente";
            }
            ddlRut.Items.Clear();
            volveracargar();
            cn.Close();
            txtNombreM.Text = "";
            txtApellidoM.Text = "";
        }

        protected void ddlRut_SelectedIndexChanged(object sender, EventArgs e)
        {
            cn.Open();
            cmd.CommandText = "select * from cliente where rut=" + ddlRut.Text;
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    txtNombreM.Text = dr[1].ToString();
                    txtApellidoM.Text = dr[2].ToString();
                }
                dr.Close();
            }
            cn.Close();
        }

        private void volveracargar()
        {
            cmd.CommandText = "select rut from cliente";
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    ddlRut.Items.Add(dr[0].ToString());
                }
            }
            dr.Close();

        }

        protected void Cancelar(object sender, EventArgs e)
        {
            txtRut.Text = "";
            txtNombre.Text = "";
            txtApellido.Text = "";
        }
    }
}