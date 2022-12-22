using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace prueba_paginas
{
    public partial class InicioSesion1 : System.Web.UI.Page
    {
        string script;
        protected void Page_Load(object sender, EventArgs e)
        {
            script = @"<script type='text/javascript'>
                            alert('{0}');
                        </script>";
        }

        protected void btn_inicio_Click(object sender, EventArgs e)
        {

            //Response.Redirect("inv_producto.aspx");

            /* -- Alerta 
            string script = @"<script type='text/javascript'>
                            alert('Usuario / Password Incorrecto');
                        </script>";

            ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
            */

            //Metodo
            //btn_inicio.Attributes["onclick"] = "alert('Se ha presionado el boton: 4'); return false;";

            //efectivo
            try
            {
                Conexion conecta = new Conexion();
                MySqlConnection conexionBD = conecta.conectar_base();

                MySqlCommand cmd = new MySqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "proc_cons_usuario";
                cmd.Connection = conexionBD;
                cmd.Parameters.AddWithValue("@var_usuario", txt_usuario.Text);
                cmd.Parameters["@var_usuario"].Direction = ParameterDirection.Input;
                cmd.Parameters.AddWithValue("@var_clave", txt_password.Text);
                cmd.Parameters["@var_clave"].Direction = ParameterDirection.Input;
                cmd.Parameters.Add(new MySqlParameter("@var_cod_consulta", MySqlDbType.Int32));
                cmd.Parameters["@var_cod_consulta"].Direction = ParameterDirection.Output;
                cmd.Connection = conexionBD;
                conexionBD.Open();
                cmd.ExecuteNonQuery();
                int resultado = (Int32)cmd.Parameters["@var_cod_consulta"].Value;
                conexionBD.Close();

                if (resultado == 1)
                {
                    Session["usuario"] = txt_usuario.Text;
                    Response.Redirect("PagPresenta.aspx");
                }
                else
                {
                    script = string.Format(script, "Usuario / Password Incorrecto");
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
                }
            }
            catch (Exception ex) {
                script = string.Format(script, ex.Message);
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
            }
                
            /*
            string script;
            script = @"<script type='text/javascript'>
                            alert('{0}');
                        </script>";

            //script = string.Format(script, ex.Message);
            script = string.Format(script, "Mensaje Sistema");

            ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
            */

        }
    }
}