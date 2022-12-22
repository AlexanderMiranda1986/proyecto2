<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InicioSesion.aspx.cs" Inherits="prueba_paginas.InicioSesion1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Inicio Sesion</title>
    <link href="assets/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }

      .b-example-divider {
        height: 3rem;
        background-color: rgba(0, 0, 0, .1);
        border: solid rgba(0, 0, 0, .15);
        border-width: 1px 0;
        box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
      }

      .b-example-vr {
        flex-shrink: 0;
        width: 1.5rem;
        height: 100vh;
      }

      .bi {
        vertical-align: -.125em;
        fill: currentColor;
      }

      .nav-scroller {
        position: relative;
        z-index: 2;
        height: 2.75rem;
        overflow-y: hidden;
      }

      .nav-scroller .nav {
        display: flex;
        flex-wrap: nowrap;
        padding-bottom: 1rem;
        margin-top: -1px;
        overflow-x: auto;
        text-align: center;
        white-space: nowrap;
        -webkit-overflow-scrolling: touch;
      }
    </style>
    <link href="css/signin.css" rel="stylesheet">

</head>
<body class="text-center">
 
    <main class="form-signin w-100 m-auto">
  <div>
    <!-- 
    <img class="mb-4" src="assets/brand/bootstrap-logo.svg" alt="" width="72" height="57">
    -->
    <img class="mb-4" src="img/LogoFarmacia.jpg" alt="" width="72" height="57">
    <h1 class="h3 mb-3 fw-normal">Ingrese Usuario y Clave</h1>

    <form id="form1" runat="server">

    <div class="form-floating">
        <!-- 
      <input type="text" class="form-control" id="floatingInput" placeholder="name@example.com">
       -->
       <asp:TextBox type="text" ID="txt_usuario" runat="server" class="form-control" placeholder="usuario">
       </asp:TextBox>
      <label for="txt_usuario">Ingrese Usuario</label>
    </div>
    <div class="form-floating">
        <!-- 
        <input type="password" class="form-control" id="floatingPassword" placeholder="Password">
        -->
       <asp:TextBox type="password" ID="txt_password" runat="server" class="form-control" placeholder="Password">
       </asp:TextBox>
      <label for="txt_password">Ingrese Password</label>
    </div>

    <div class="checkbox mb-3">
      <label>
        <input type="checkbox" value="remember-me" /> Remember me
      </label>
    </div>
    <!-- 
    <button class="w-100 btn btn-lg btn-primary" type="submit" runat="server">Sig In</button>
    -->
        <div>   
            <asp:Button class="w-100 btn btn-lg btn-primary" ID="btn_inicio" runat="server" Text="Inicio Sesion" OnClick="btn_inicio_Click" />
        </div>
    </form>
   </div>
    <p class="mt-5 mb-3 text-muted">&copy; 2022–2023</p>
  </main>

    
</body>
</html>
