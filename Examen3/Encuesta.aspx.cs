using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Examen2progra.Clases;

namespace Examen3
{
    public partial class Encuesta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public void alertas(string texto)
        {
            string message = texto;
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append("<script type = 'text/javascript'>");
            sb.Append("window.onload=function(){");
            sb.Append("alert('");
            sb.Append(message);
            sb.Append("')};");
            sb.Append("</script>");
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            
            string nombre = txtNombre.Text;
            int edad;
            string correo = txtCorreo.Text;
            int partidoPoliticoID;

            
            if (!int.TryParse(txtEdad.Text, out edad))
            {
                alertas("Por favor, ingrese una edad válida.");
                return;
            }

            
            if (!int.TryParse(ddlPartidoPolitico.SelectedValue, out partidoPoliticoID))
            {
                alertas("Por favor, seleccione un partido político.");
                return;
            }

            
            try
            {
                using (SqlConnection connection = DBConn.obtenerConexion())
                {
                    using (SqlCommand command = new SqlCommand("sp_AgregarEncuesta", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.AddWithValue("@Nombre", nombre);
                        command.Parameters.AddWithValue("@Edad", edad);
                        command.Parameters.AddWithValue("@CorreoElectronico", correo);
                        command.Parameters.AddWithValue("@PartidoPoliticoID", partidoPoliticoID);

                        command.ExecuteNonQuery();
                    }
                }

                
                txtNombre.Text = string.Empty;
                txtEdad.Text = string.Empty;
                txtCorreo.Text = string.Empty;
                ddlPartidoPolitico.SelectedIndex = 0;

                
                alertas("Encuesta agregada con éxito.");
            }
            catch (Exception ex)
            {
               
                alertas("Fallo al agregar la encuesta. Error: " + ex.Message);
            }
        }


    }
}