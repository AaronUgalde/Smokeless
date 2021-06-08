<%-- 
    Document   : actuuarios
    Created on : 26/05/2021, 03:03:30 AM
    Author     : yayah
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*, java.util.*, java.text.*, encapsulamiento.Logueo,  encapsulamiento.ConexionDB" %>

<!DOCTYPE html>
<link rel="stylesheet" href="./css/actualizar.css">
<link rel="stylesheet" href="./css/hola.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Assistant:wght@300&display=swap" rel="stylesheet">
<style type="text/css">
  a:link {color:#ffffff;}
  a:visited {color:#ffffff;}
  a:active {color:#ffffff;}
  a:hover {color:#ffffff;}
  </style>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Actualizar Cuenta</title>
    </head>
    <body>
     <header> 
        <h1>SMOKELESS</h1>
        <div class="contenido-header">
        <a href="menuinicial.jsp" id="menu" style="color:black;">MENU</a>
        <a href="https://smokelesspy.herokuapp.com/home/<%=session.getAttribute("id")%>">Hacer Tu prediccion </a>
        <a href="login.html"></a></div></header>
    
        <h1>Tabla de Datos de la Cuenta</h1>
        <form method="post" name="formularioeditar" action="" style="text-decoration: none">
            <table border="2" >
                
                <%
                    Connection con = null;
                    Statement set = null;
                    ResultSet rs = null;
                    String url, userName, password, driver;
                    url = "jdbc:mysql://bb09774d825d44:53b46282@us-cdbr-east-04.cleardb.com/heroku_f9a5861cbf134bb?reconnect=true&useSSL=false";
                    userName = "bb09774d825d44";
                    password = "53b46282";
                    driver = "com.mysql.cj.jdbc.Driver";
                    try{
                        Class.forName(driver);
                        con = DriverManager.getConnection(url, userName, password);
                        try{
                             String nombre1, nacimiento1, sexo1, edad1 ;
                            
                            nombre1 = request.getParameter("name");
                            nacimiento1 = request.getParameter("naci");
                            sexo1= request.getParameter("sexo");
                            edad1 = request.getParameter("eda");
                            
                            String q = "UPDATE bdcrear SET  nombre='"+nombre1+"', nacimiento='"+nacimiento1+"',sexo='"+sexo1+"',eda='"+edad1+"'  "
                                     + "where id_usua ='"+session.getAttribute("id")+"'";
                            set=con.createStatement();
                             int actuzalizar = set.executeUpdate(q);
                             System.out.println(q);
                    
                    %>
            <h1>Registro Actualizado con Exito</h1>        
                    <%
                    set.close();
                        
                        }catch(SQLException ed){
                            System.out.println("Error al consultar la tabla");
                            System.out.println(ed.getMessage());
                          
                        
                        }
                        con.close();
                    
                    }catch(Exception e){
                        System.out.println("Error al conectar con la bd");
                        System.out.println(e.getMessage());
                        System.out.println(e.getStackTrace());
                %>
        <h1>Sitio en Construcción</h1>            
                    <%
                    
                    }
                    %>
                
                
            </table>
                   <input type="reset" value="Borrar Datos" style="text-decoration: none;">
                    
            
        </form>
    </body>
</html>
