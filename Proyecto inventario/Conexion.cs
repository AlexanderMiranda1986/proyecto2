using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace prueba_paginas
{
    public class Conexion
    {
        public MySqlConnection conectar_base () {
            string servidor = "localhost"; //Nombre o ip del servidor de MySQL
            string bd = "db_inventario"; //Nombre de la base de datos
            string usuario = "apl_proyecto"; //Usuario de acceso a MySQL
            string password = ""; //Contraseña de usuario de acceso a MySQL

            //Crearemos la cadena de conexión concatenando las variables
            string cadenaConexion = "Database=" + bd + "; Data Source=" + servidor + "; User Id=" + usuario + "; Password=" + password + "";

            //Instancia para conexión a MySQL, recibe la cadena de conexión
            MySqlConnection conexionBD = new MySqlConnection(cadenaConexion);
            return conexionBD;
        }
    }
    
}