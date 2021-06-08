<%-- 
    Document   : actuuarios
    Created on : 26/05/2021, 03:03:30 AM
    Author     : yayah
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*, java.util.*, java.text.*" %>
<!DOCTYPE html>
<link rel="stylesheet" href="./css/respuestsas.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Assistant:wght@300&display=swap" rel="stylesheet">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Actualizar Cuenta</title>
    </head>
    <body>
     <header> 
        <h1>SMOKELESS</h1>
        <div class="contenido-header">
        <a href="menuinicial.jsp" id="menu">MENU</a>
        <a href="https://smokelesspy.herokuapp.com/home/<%=session.getAttribute("id")%>" id="pro">PROYECTAR</a>
        <a href="cuestionarioDiario.html" id="cue">CUESTIONARIO</a>
        <a href="index.html" id="sc">CERRAR</a>
        <a href="login.html"></a></div></header>
       
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
                            edad1 = request.getParameter("edad");
                            
                            String q = "UPDATE bdcrear SET  nombre='"+nombre1+"', nacimiento='"+nacimiento1+"',sexo='"+sexo1+"',eda='"+edad1+"'  "
                                     + "where id_usua ='"+session.getAttribute("id")+"'";
                            set=con.createStatement();
                             int actuzalizar = set.executeUpdate(q);
                             System.out.println(q);
                    
                    %>
                    <div class="content">
                    <h1>Registro Actualizado con Exito</h1>
                    </div>
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
        
             <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
            <a href="datosUsua.jsp" id="v">Volver a actualizar</a>
           <div>
        <footer>
            Technology Innovation Space
            <br>
            Cedillo López Erick Omar
            <br>
            Granados Martínez Pablo Daniel
            <br>
            Jiménez Bernal Ernesto Amador
            <br>
            López Castillo Azurim Sua
            <br>
            Ugalde Tellez Aaron
            <br>
            Tellez de la Cruz Esaul
        </footer>
    </div>
        
    </body>
</html>
