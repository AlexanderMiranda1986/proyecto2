<%@ Page Title="" Language="C#" MasterPageFile="~/InvMaster.Master" AutoEventWireup="true" CodeBehind="inv_rep_movimiento.aspx.cs" Inherits="prueba_paginas.inv_rep_movimiento" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="margin-right:30px">
       <div style="font-size: xx-large; text-align: center; width: 804px; margin-left: 47px;">
          <label>REPORTE DE MOVIMIENTOS DE PRODUCTOS</label>
       </div>

       <div class="form-row">
        <div class="form-group col-md-2">
          <label for="txt_fecha_desde">Fecha Desde</label>
          <asp:TextBox type="date" ID="txt_fecha_desde" runat="server" class="form-control form-control-sm" >
          </asp:TextBox>
        </div>
        <div class="form-group col-md-2">
          <label for="txt_fecha_hasta">Fecha Hasta</label>
           <asp:TextBox type="date" ID="txt_fecha_hasta" runat="server" class="form-control form-control-sm" >
          </asp:TextBox>           
        </div>

        <div class="form-group col-md-2">
          <label for="cmb_tipo_mov">Tipo Movimiento</label>
           <asp:DropDownList ID="cmb_tipo_mov" runat="server" class="form-control form-control-sm">
            </asp:DropDownList>
        </div>
        
         <div class="form-group col-md-2">
             <label for="btn_buscar">Presione</label>
            <asp:Button class="w-100 btn btn-lg btn-secondary btn-sm" ID="btn_buscar" runat="server" Text="Buscar" OnClick="btn_buscar_Click" />
        </div>
      </div>

        <br />
       
        <div class="form-row" style="overflow:auto; width:250px; height:500px; align:left;">
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
       <br />
       <div style="font-size: large; text-align: center ; width: 804px; margin-left: 47px;">
          <label>LISTA DE PRODUCTOS POR MOVIMIENTO</label>
       </div>
       
       <div class="form-row" style="overflow:auto; width:250px; height:300px; align:left;">
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
