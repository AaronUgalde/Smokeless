<%-- 
    Document   : borrarcuenta
    Created on : 26/05/2021, 04:46:48 PM
    Author     : yayah
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*, java.util.*, java.text.*" %>
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
        <a href="menu.html" id="menu">MENU</a>
        <a href="proyecciones.html" id="pro">PROYECTAR</a>
        <a href="recomendaciones.html" id="rec">RECOMENDACIONES</a>
        <a href="login.html"></a></div></header>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Borrar Registro</title>
    </head>
    <body>
        
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
                    String idS = String.valueOf(session.getAttribute("id")); 
                    int id = Integer.parseInt(idS);
                    
                    String q = "delete from bdcrear where id_usua = "+id;
                    System.out.println(q);
                    
                    set = con.createStatement();
                    
                    int borrar = set.executeUpdate(q);
                    
                    session.setAttribute("id", "");
                    
                    
                    %>
            <h1>Cuenta Borrado con Exito</h1>  
            
            
                    <%
                        
                    set.close();
                    
                    response.sendRedirect("index.html"); 
                
                }catch(SQLException ed){
                    System.out.println("Error al borrar el registro de la tabla");
                    System.out.println(ed.getMessage());
                    %>
            <h1>Registro No Borrado con Exito, error en el recurso, solo juguito again</h1>        
                    <%
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
        
        <br>
                   <a href='index.html?id=<%=session.getAttribute("id")%>ban=<%=session.getAttribute("ban")%>' >Regresar </a>
                   
        
    </body>
</html>
