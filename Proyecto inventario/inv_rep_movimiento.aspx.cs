using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace prueba_paginas
{
    public partial class inv_rep_movimiento : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuario"] == null)
            {
                Response.Redirect("InicioSesion.aspx");
            }

            if (!IsPostBack)
            {
                ListItem t;
                t = new ListItem("Todos", "T");
                cmb_tipo_mov.Items.Add(t);
                t = new ListItem("Ingreso", "I");
                cmb_tipo_mov.Items.Add(t);
                t = new ListItem("Retiro", "R");
                cmb_tipo_mov.Items.Add(t);
                cmb_tipo_mov.SelectedIndex = 0;
            }

        }

        protected void btn_buscar_Click(object sender, EventArgs e)
        {
            string fecha = txt_fecha_desde.Text;

        }
    }
}