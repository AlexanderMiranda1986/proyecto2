<%@ Page Title="" Language="C#" MasterPageFile="~/InvMaster.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="inv_producto.aspx.cs" Inherits="prueba_paginas.inv_producto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .form-row {
            width: 883px;
            margin-left: 9px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="container" style="margin-right:30px">
       <div style="font-size: xx-large; text-align: center; width: 804px; margin-left: 47px;">
          <label>REGISTRO DE PRODUCTOS</label>
       </div>
      <div class="form-row">
        <div class="form-group col-md-3">
          <label for="txt_cod_producto">Codigo Producto</label>
          <asp:TextBox type="text" ID="txt_cod_producto" runat="server" class="form-control form-control-sm" >
          </asp:TextBox>
        </div>
        <div class="form-group col-md-9">
          <label for="txt_nombre">Nombre Producto</label>
          <asp:TextBox type="text" ID="txt_nombre" runat="server" class="form-control form-control-sm">
          </asp:TextBox>
        </div>
      </div>

      <div class="form-row">
        <div class="form-group col-md-4">
          <label for="cmb_tipo">Tipo Producto</label>
           <asp:DropDownList ID="cmb_tipo" runat="server" class="form-control form-control-sm">
            </asp:DropDownList>
        </div>
        <div class="form-group col-md-3">
          <label for="txt_precio">Precio</label>
          <asp:TextBox type="text" ID="txt_precio" runat="server" class="form-control form-control-sm">
          </asp:TextBox>
        </div>
        <div class="form-group col-md-2">
          <label for="txt_cantidad">Cantidad</label>
          <asp:TextBox type="text" ID="txt_cantidad" runat="server" class="form-control form-control-sm" readonly="true">
          </asp:TextBox>
        </div>
        <div class="form-group col-md-3">
          <label for="cmb_estado">Estado Producto</label>
           <asp:DropDownList ID="cmb_estado" runat="server" class="form-control form-control-sm">
            </asp:DropDownList>
        </div>
      </div>

      <div class="form-row">
        <div class="form-group col-md-3">
          <label for="txt_usuario_ing">Usuario Ingreso</label>
          <asp:TextBox type="text" ID="txt_usuario_ing" runat="server" class="form-control form-control-sm" readonly="true">
          </asp:TextBox>
        </div>
        <div class="form-group col-md-3">
          <label for="txt_fecha_ing">Fecha Ingreso</label>
          <asp:TextBox type="text" ID="txt_fecha_ing" runat="server" class="form-control form-control-sm" readonly="true">
          </asp:TextBox>
        </div>
        <div class="form-group col-md-3">
          <label for="txt_usuario_modifica">Usuario Ingreso</label>
          <asp:TextBox type="text" ID="txt_usuario_modifica" runat="server" class="form-control form-control-sm" readonly="true">
          </asp:TextBox>
        </div>
        <div class="form-group col-md-3">
          <label for="txt_fecha_modifica">Fecha Ingreso</label>
          <asp:TextBox type="text" ID="txt_fecha_modifica" runat="server" class="form-control form-control-sm" readonly="true">
          </asp:TextBox>
        </div>
      </div>

       <div class="form-row" Style =" text-align:right">
        <div class="form-group col-md-6">
        </div>
        <div class="form-group col-md-2">
          <asp:Button class="w-100 btn btn-lg btn-outline-info btn-sm" ID="btn_nuevo" runat="server" Text="Nuevo" OnClick="btn_nuevo_Click"  />
        </div>
        <div class="form-group col-md-2">
         <asp:Button class="w-100 btn btn-lg btn-outline-info btn-sm" ID="btn_grabar" runat="server" Text="Grabar" OnClick="btn_grabar_Click"  />
        </div>
        <div class="form-group col-md-2">
         <asp:Button class="w-100 btn btn-lg btn-outline-info btn-sm" ID="btn_eliminar" runat="server" Text="Eliminar" OnClick="btn_eliminar_Click"  />
        </div>
      </div>

       <div class="form-row">
        <div class="form-group col-md-2">
          <label for="cmb_tipo_busqueda">Busqueda por:</label>
           <asp:DropDownList ID="cmb_tipo_busqueda" runat="server" class="form-control form-control-sm" 
               style="font-size =12">
            </asp:DropDownList>
        </div>
        <div class="form-group col-md-7">
          <label for="txt_busqueda">Ingrese texto a buscar..</label>
          <asp:TextBox type="text" ID="txt_busqueda" runat="server" class="form-control form-control-sm">
          </asp:TextBox>
        </div>
         <div class="form-group col-md-2">
             <label for="btn_buscar">Presione</label>
            <asp:Button class="w-100 btn btn-lg btn-secondary btn-sm" ID="btn_buscar" runat="server" Text="Buscar" OnClick="btn_buscar_Click"  />
        </div>
      </div>
      
      <div class="form-row" style="overflow:auto; width:100%; height:300px; margin-left:50px">

          <asp:GridView ID="grd_datos" runat="server" 
              BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" 
              BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" AutoGenerateColumns="False"
              OnSelectedIndexChanged="grd_datos_SelectedIndexChanged" OnSelectedIndexChanging="grd_datos_SelectedIndexChanging1"
               OnRowDataBound="grd_datos_RowDataBound" >
              <Columns>
                  <asp:BoundField DataField="prd_codigo" HeaderText="Codigo" ReadOnly="True" >
                  <ControlStyle Width="20px" />
                  </asp:BoundField>
                  <asp:BoundField DataField="prd_nombre" HeaderText="Nombre">
                  <ControlStyle Width="100px" />
                  </asp:BoundField>
                  <asp:BoundField DataField="prd_precio" HeaderText="Precio">
                  <ControlStyle Width="10px" />
                  </asp:BoundField>
                  <asp:BoundField DataField="prd_cantidad" HeaderText="Cantidad">
                  <ControlStyle Width="10px" />
                  </asp:BoundField>
                  <asp:BoundField DataField="est_codigo" HeaderText="cod_estado" >
                  <ControlStyle Width="0px" />
                  </asp:BoundField>
                  <asp:BoundField DataField="est_nombre" HeaderText="Estado Producto"  >
                  <ControlStyle Width="30px" />
                  </asp:BoundField>
                  <asp:BoundField DataField="tip_codigo" HeaderText="tip_codigo" >
                  <ControlStyle Width="10px" />
                  </asp:BoundField>
                  <asp:BoundField DataField="tip_nombre" HeaderText="Tipo Producto"  >
                  <ControlStyle Width="30px" />
                  </asp:BoundField>
                  <asp:BoundField DataField="usu_cod_ingresa" HeaderText="usu_cod_ingresa" >
                  <ControlStyle Width="10px" />
                  </asp:BoundField>
                  <asp:BoundField DataField="prd_fecha_ingresa" HeaderText="prd_fecha_ingresa" >
                  <ControlStyle Width="10px" />
                  </asp:BoundField>
                  <asp:BoundField DataField="usu_cod_modifica" HeaderText="usu_cod_modifica" >
                  <ControlStyle Width="10px" />
                  </asp:BoundField>
                  <asp:BoundField DataField="prd_fecha_modifica" HeaderText="prd_fecha_modifica"  >
                  <ControlStyle Width="10px" />
                  </asp:BoundField>
                  <asp:ButtonField Text="..." />
              </Columns>
              <FooterStyle BackColor="#CCCCCC" />
              <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
              <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
              <RowStyle BackColor="White" />
              <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
              <SortedAscendingCellStyle BackColor="#F1F1F1" />
              <SortedAscendingHeaderStyle BackColor="#808080" />
              <SortedDescendingCellStyle BackColor="#CAC9C9" />
              <SortedDescendingHeaderStyle BackColor="#383838" />
          </asp:GridView>

      </div>

    </div>
</asp:Content>
