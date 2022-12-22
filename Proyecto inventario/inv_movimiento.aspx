<%@ Page Title="" Language="C#" MasterPageFile="~/InvMaster.Master" AutoEventWireup="true" CodeBehind="inv_movimiento.aspx.cs" Inherits="prueba_paginas.inv_movimiento" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container" style="margin-right:30px">
       <div style="font-size: xx-large; text-align: center; width: 804px; margin-left: 47px;">
          <label>REGISTRO DE MOVIMIENTOS DE PRODUCTOS</label>
       </div>

       <div class="form-row">
        <div class="form-group col-md-3">
          <label for="txt_referencia">Cod. Referencia Producto</label>
          <asp:TextBox type="text" ID="txt_referencia" runat="server" class="form-control form-control-sm" >
          </asp:TextBox>
        </div>
        <div class="form-group col-md-2">
          <label for="cmb_tipo_mov">Tipo Movimiento</label>
           <asp:DropDownList ID="cmb_tipo_mov" runat="server" class="form-control form-control-sm">
            </asp:DropDownList>
        </div>
        <div class="form-group col-md-2">
          <label for="txt_fecha_registro">Fecha de Registro</label>
           <asp:TextBox type="date" ID="txt_fecha_registro" runat="server" class="form-control form-control-sm" >
          </asp:TextBox>           
        </div>
         <div class="form-group col-md-2">
             <label for="btn_registrar">Movimiento</label>
            <asp:Button class="w-100 btn btn-lg btn-secondary btn-sm" ID="btn_registrar" runat="server" Text="Registrar" />
        </div>
      </div>
      
       <div class="form-row">
        <div class="form-group col-md-2">
          <label for="cmb_tipo_busqueda">Busqueda por:</label>
           <asp:DropDownList ID="cmb_tipo_busqueda" runat="server" class="form-control form-control-sm" 
               style="font-size =12">
            </asp:DropDownList>
        </div>
        <div class="form-group col-md-5">
          <label for="txt_busqueda">Ingrese texto a buscar..</label>
          <asp:TextBox type="text" ID="txt_busqueda" runat="server" class="form-control form-control-sm">
          </asp:TextBox>
        </div>
         <div class="form-group col-md-2">
             <label for="btn_buscar">Presione</label>
            <asp:Button class="w-100 btn btn-lg btn-secondary btn-sm" ID="btn_buscar" runat="server" Text="Buscar"   />
        </div>
      </div>
      
       <div class="form-row" style="overflow:auto; width:500px; height:200px; align:left;">
          <asp:GridView ID="grd_datos" runat="server" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" 
              BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black"  
              EnableModelValidation="True" EmptyDataText="No existen registros." 
              AutoGenerateColumns="False"  Height="100px">
              <Columns>
                  <asp:BoundField DataField="Codigo" HeaderText="Codigo" />
                  <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
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

       <div class="form-row">
        <div class="form-group col-md-2">
          <label for="txt_cod_producto">Codigo Producto</label>
          <asp:TextBox type="text" ID="txt_cod_producto" runat="server" class="form-control form-control-sm"  readonly="true">
          </asp:TextBox>
        </div>
        <div class="form-group col-md-3">
          <label for="txt_nombre">Nombre Producto</label>
          <asp:TextBox type="text" ID="txt_nombre" runat="server" class="form-control form-control-sm"  readonly="true">
          </asp:TextBox>
        </div>
        <div class="form-group col-md-2">
          <label for="txt_cantidad">Cantidad</label>
          <asp:TextBox type="text" ID="txt_cantidad" runat="server" class="form-control form-control-sm">
          </asp:TextBox>
        </div>
        <div class="form-group col-md-2">
             <label for="btn_buscar">Agregar</label>
            <asp:Button class="w-100 btn btn-lg btn-secondary btn-sm" ID="Button1" runat="server" Text="Producto" OnClick="Button1_Click"  />
        </div>
      </div>
      
       <div style="font-size: large; text-align: center ; width: 804px; margin-left: 47px;">
          <label>LISTA DE PRODUCTOS ASIGNADOS</label>
       </div>
       
       <div class="form-row" style="overflow:auto; width:500px; height:300px; align:left;">
          <asp:GridView ID="grd_prod" runat="server" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" 
              BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black"  
              EnableModelValidation="True" EmptyDataText="No existen registros." 
              AutoGenerateColumns="False"  Height="100px">
              <Columns>
                  <asp:BoundField DataField="Codigo" HeaderText="Codigo" />
                  <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
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
