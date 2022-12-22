using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MySql.Data.MySqlClient;

namespace prueba_paginas
{
    public partial class inv_producto : System.Web.UI.Page
    {
        string script;
        protected void Page_Load(object sender, EventArgs e)
        {
           
            script = @"<script type='text/javascript'>
                            alert('{0}');
                        </script>";

            if (Session["usuario"] == null) {
                Response.Redirect("InicioSesion.aspx");
            }

            if (!IsPostBack) {

                Session["tipo_graba"] = "I";
                //Session["datos"] = null;

                ListItem i;
                i = new ListItem("Todos", "T");
                cmb_tipo_busqueda.Items.Add(i);
                i = new ListItem("Codigo", "C");
                cmb_tipo_busqueda.Items.Add(i);
                i = new ListItem("Nombre", "N");
                cmb_tipo_busqueda.Items.Add(i);

                llena_combos();
            }

        }

        private void llena_combos() {
            try
            {
                Conexion conecta = new Conexion();
                MySqlConnection conexionBD = conecta.conectar_base();

                MySqlCommand cmd = new MySqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "proc_cons_catalogos";
                cmd.Connection = conexionBD;
                cmd.Parameters.AddWithValue("@var_tipo_cons", "ET");
                cmd.Connection = conexionBD;
                conexionBD.Open();

                MySqlDataAdapter m_datos = new MySqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                m_datos.Fill(ds);

                cmb_estado.DataSource = ds;

                cmb_estado.DataTextField = "est_nombre";
                cmb_estado.DataValueField = "est_codigo";
                cmb_estado.DataBind();

                cmb_estado.SelectedIndex = 0;

                conexionBD.Close();

            }
            catch (Exception ex)
            {
                script = string.Format(script, "Error Llena Estado: " + ex.Message);
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
            }

            try
            {
                Conexion conecta = new Conexion();
                MySqlConnection conexionBD = conecta.conectar_base();

                MySqlCommand cmdT = new MySqlCommand();
                cmdT.CommandType = CommandType.StoredProcedure;
                cmdT.CommandText = "proc_cons_catalogos";
                cmdT.Connection = conexionBD;
                cmdT.Parameters.AddWithValue("@var_tipo_cons", "TP");
                cmdT.Connection = conexionBD;
                conexionBD.Open();

                MySqlDataAdapter m_datosT = new MySqlDataAdapter(cmdT);
                DataSet dsT = new DataSet();
                m_datosT.Fill(dsT);

                cmb_tipo.DataSource = dsT;

                cmb_tipo.DataTextField = "tip_nombre";
                cmb_tipo.DataValueField = "tip_codigo";
                cmb_tipo.DataBind();

                cmb_tipo.SelectedIndex = 0;

                conexionBD.Close();

            }
            catch (Exception ex)
            {
                script = string.Format(script, "Error Llena Tipo: " + ex.Message);
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
            }

        }

        protected void btn_buscar_Click(object sender, EventArgs e)
        {

            busqueda_datos();
        }

        private void busqueda_datos() 
        {
            try
            {
                Conexion conecta = new Conexion();
                MySqlConnection conexionBD = conecta.conectar_base();

                MySqlCommand cmd = new MySqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "proc_cons_producto";
                cmd.Connection = conexionBD;
                cmd.Parameters.AddWithValue("@var_consulta", txt_busqueda.Text);
                cmd.Parameters.AddWithValue("@var_tipo_cons", cmb_tipo_busqueda.SelectedValue);
                cmd.Connection = conexionBD;
                conexionBD.Open();

                MySqlDataAdapter m_datos = new MySqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                m_datos.Fill(ds);

                Session["datos"] = ds;

                grd_datos.DataSource = ds;
                grd_datos.DataBind();
                
                grd_datos.Columns[4].Visible = false;
                grd_datos.Columns[6].Visible = false;
                grd_datos.Columns[8].Visible = false;
                grd_datos.Columns[9].Visible = false;
                grd_datos.Columns[10].Visible = false;
                grd_datos.Columns[11].Visible = false;
                
                conexionBD.Close();

            }
            catch (Exception ex)
            {
                script = string.Format(script, ex.Message);
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
            }
        }

        protected void grd_datos_SelectedIndexChanged(object sender, EventArgs e)
        {
            int fila = grd_datos.SelectedIndex;
            //GridViewRow row = grd_datos.Rows[e.NewSelectedIndex];
        }

        protected void grd_datos_SelectedIndexChanging1(object sender, GridViewSelectEventArgs e)
        {
            //DataTable data = Session["datos"] as DataTable;
            DataSet data = Session["datos"] as DataSet;

            DataRow row = data.Tables[0].Rows[e.NewSelectedIndex];
            txt_cod_producto.Text = row["prd_codigo"].ToString();
            txt_nombre.Text = row["prd_nombre"].ToString();
            txt_precio.Text = row["prd_precio"].ToString();
            txt_cantidad.Text = row["prd_cantidad"].ToString();
            cmb_estado.SelectedValue = row["est_codigo"].ToString();
            cmb_tipo.SelectedValue = row["tip_codigo"].ToString();
            txt_usuario_ing.Text = row["usu_cod_ingresa"].ToString();
            txt_fecha_ing.Text = row["prd_fecha_ingresa"].ToString();
            txt_usuario_modifica.Text = row["usu_cod_modifica"].ToString();
            txt_fecha_modifica.Text = row["prd_fecha_modifica"].ToString();

            /*
            GridViewRow row = grd_datos.Rows[e.NewSelectedIndex];
            txt_cod_producto.Text = row.Cells[0].Text;
            txt_nombre.Text = row.Cells[1].Text;
            txt_precio.Text = row.Cells[2].Text;
            txt_cantidad.Text = row.Cells[3].Text;
            cmb_estado.SelectedValue = row.Cells[4].Text;
            cmb_tipo.SelectedValue = row.Cells[6].Text;
            txt_usuario_ing.Text = row.Cells[8].Text;
            txt_fecha_ing.Text = row.Cells[9].Text;
            txt_usuario_modifica.Text = row.Cells[10].Text;
            txt_fecha_modifica.Text = row.Cells[11].Text;
            */

            Session["tipo_graba"] = "U";

        }

        protected void grd_datos_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(grd_datos, "Select$" + e.Row.RowIndex);
                e.Row.ToolTip = "Haga click para seleccionar la fila.";
            }
        }

        protected void btn_nuevo_Click(object sender, EventArgs e)
        {
            borra_campos();

        }

        private void borra_campos() {
            txt_busqueda.Text = "";
            txt_cantidad.Text = "";
            txt_cod_producto.Text = "";
            txt_fecha_ing.Text = "";
            txt_fecha_modifica.Text = "";
            txt_nombre.Text = "";
            txt_precio.Text = "";
            txt_usuario_ing.Text = "";
            txt_usuario_modifica.Text = "";
            cmb_estado.SelectedIndex = 0;
            cmb_tipo.SelectedIndex = 0;
            cmb_tipo_busqueda.SelectedIndex = 0;
            
            grd_datos.DataSource = null;
            grd_datos.DataBind();

            Session["tipo_graba"] = "I";

        }

        protected void btn_grabar_Click(object sender, EventArgs e)
        {
            try
            {

                String tipo_grb = Session["tipo_graba"].ToString();

                Conexion conecta = new Conexion();
                MySqlConnection conexionBD = conecta.conectar_base();

                MySqlCommand cmd = new MySqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "proc_mant_producto";
                cmd.Connection = conexionBD;
                
                cmd.Parameters.AddWithValue("@var_codigo", txt_cod_producto.Text);
                cmd.Parameters["@var_codigo"].Direction = ParameterDirection.Input;
                cmd.Parameters.AddWithValue("@var_nombre", txt_nombre.Text);
                cmd.Parameters["@var_nombre"].Direction = ParameterDirection.Input;
                cmd.Parameters.AddWithValue("@var_tipo_prod", cmb_tipo.SelectedValue);
                cmd.Parameters["@var_tipo_prod"].Direction = ParameterDirection.Input;
                cmd.Parameters.AddWithValue("@var_precio", Convert.ToDecimal(txt_precio.Text));
                cmd.Parameters["@var_precio"].Direction = ParameterDirection.Input;
                cmd.Parameters.AddWithValue("@var_estado", cmb_estado.SelectedValue);
                cmd.Parameters["@var_estado"].Direction = ParameterDirection.Input;
                cmd.Parameters.AddWithValue("@var_usuario", Session["usuario"].ToString());
                cmd.Parameters["@var_usuario"].Direction = ParameterDirection.Input;
                cmd.Parameters.AddWithValue("@var_tipo_reg", tipo_grb);
                cmd.Parameters["@var_tipo_reg"].Direction = ParameterDirection.Input;

                cmd.Parameters.Add(new MySqlParameter("@var_cod_error", MySqlDbType.Int32));
                cmd.Parameters["@var_cod_error"].Direction = ParameterDirection.Output;
                cmd.Parameters.Add(new MySqlParameter("@var_msj_error", MySqlDbType.String));
                cmd.Parameters["@var_msj_error"].Direction = ParameterDirection.Output;

                cmd.Connection = conexionBD;
                conexionBD.Open();
                cmd.ExecuteNonQuery();

                int resultado = (Int32)cmd.Parameters["@var_cod_error"].Value;
                String mensaje_proceso = cmd.Parameters["@var_msj_error"].Value.ToString();
                conexionBD.Close();

                script = string.Format(script, mensaje_proceso);
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);

                Session["tipo_graba"] = "I";

                if (resultado == 0)
                {
                    borra_campos();
                }
                
            }
            catch (Exception ex)
            {
                script = string.Format(script, ex.Message);
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
            }
        }

        protected void btn_eliminar_Click(object sender, EventArgs e)
        {
            try
            {

                Conexion conecta = new Conexion();
                MySqlConnection conexionBD = conecta.conectar_base();

                MySqlCommand cmd = new MySqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "proc_mant_producto";
                cmd.Connection = conexionBD;

                cmd.Parameters.AddWithValue("@var_codigo", txt_cod_producto.Text);
                cmd.Parameters["@var_codigo"].Direction = ParameterDirection.Input;
                cmd.Parameters.AddWithValue("@var_nombre", txt_nombre.Text);
                cmd.Parameters["@var_nombre"].Direction = ParameterDirection.Input;
                cmd.Parameters.AddWithValue("@var_tipo_prod", cmb_tipo.SelectedValue);
                cmd.Parameters["@var_tipo_prod"].Direction = ParameterDirection.Input;
                cmd.Parameters.AddWithValue("@var_precio", Convert.ToDecimal(txt_precio.Text));
                cmd.Parameters["@var_precio"].Direction = ParameterDirection.Input;
                cmd.Parameters.AddWithValue("@var_estado", cmb_estado.SelectedValue);
                cmd.Parameters["@var_estado"].Direction = ParameterDirection.Input;
                cmd.Parameters.AddWithValue("@var_usuario", Session["usuario"].ToString());
                cmd.Parameters["@var_usuario"].Direction = ParameterDirection.Input;
                cmd.Parameters.AddWithValue("@var_tipo_reg", "E");
                cmd.Parameters["@var_tipo_reg"].Direction = ParameterDirection.Input;

                cmd.Parameters.Add(new MySqlParameter("@var_cod_error", MySqlDbType.Int32));
                cmd.Parameters["@var_cod_error"].Direction = ParameterDirection.Output;
                cmd.Parameters.Add(new MySqlParameter("@var_msj_error", MySqlDbType.String));
                cmd.Parameters["@var_msj_error"].Direction = ParameterDirection.Output;

                cmd.Connection = conexionBD;
                conexionBD.Open();
                cmd.ExecuteNonQuery();

                int resultado = (Int32)cmd.Parameters["@var_cod_error"].Value;
                String mensaje_proceso = cmd.Parameters["@var_msj_error"].Value.ToString();
                conexionBD.Close();

                script = string.Format(script, mensaje_proceso);
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);

                Session["tipo_graba"] = "I";

                if (resultado == 0)
                {
                    borra_campos();
                }

            }
            catch (Exception ex)
            {
                script = string.Format(script, ex.Message);
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
            }

        }
    }
}