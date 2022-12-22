using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace prueba_paginas
{
    public partial class inv_movimiento : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["usuario"] == null)
            {
                Response.Redirect("InicioSesion.aspx");
            }

            if (!IsPostBack)
            {
                ListItem i;
                i = new ListItem("Todos", "T");
                cmb_tipo_busqueda.Items.Add(i);
                i = new ListItem("Codigo", "C");
                cmb_tipo_busqueda.Items.Add(i);
                i = new ListItem("Nombre", "N");
                cmb_tipo_busqueda.Items.Add(i);
                cmb_tipo_busqueda.SelectedIndex = 0;

                ListItem t;
                t = new ListItem("Ingreso", "I");
                cmb_tipo_mov.Items.Add(t);
                t = new ListItem("Retiro", "R");
                cmb_tipo_mov.Items.Add(t);
                cmb_tipo_mov.SelectedIndex = 0;

                DataTable data = new DataTable();
                data.Columns.Add("Codigo");
                data.Columns.Add("Nombre");
                DataRow fila;
                fila = data.NewRow();
                fila["Codigo"] = "A03";
                fila["Nombre"] = "MERCADERIA 111";
                data.Rows.Add(fila);

                fila = data.NewRow();
                fila["Codigo"] = "A05";
                fila["Nombre"] = "MERCADERIA brava 111";
                data.Rows.Add(fila);

                fila = data.NewRow();
                fila["Codigo"] = "A05";
                fila["Nombre"] = "OTRA MERCADERIA PARA REGISTRO";
                data.Rows.Add(fila);

                grd_datos.DataSource = data;
                grd_datos.DataBind();

                grd_prod.DataSource = data;
                grd_prod.DataBind();
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }
    }
}