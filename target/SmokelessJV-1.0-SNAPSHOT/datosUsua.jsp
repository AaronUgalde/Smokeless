<%-- 
    Document   : actualizardatos
    Created on : 26/05/2021, 01:17:01 AM
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
        <title>Consulta de Cuentas</title>
    </head>
    <body>
    <header> 
        <h1>SMOKELESS</h1>
        <div class="contenido-header">
        <a href="menu.html" id="menu">MENU</a>
        <a href="proyecciones.html" id="pro" style="color: black;">PROYECTAR</a>
        <a href="recomendaciones.html" id="rec" style="color: black;">RECOMENDACIONES</a>
        <a href="login.html"></a></div></header>
        <h1>Datos De Usuario</h1>
        <br>
        <div class="contenido-header">
                    <header>
            
            <tbody>
                
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
                            String q = "select nombre, nacimiento,sexo ,eda from bdcrear WHERE id_usua='"+session.getAttribute("id")+"'";;
                            
                            System.out.println(q);
                            
                            set = con.createStatement();
                            rs = set.executeQuery(q);
                            while(rs.next()){
                            
                %>
                 <form method="post" name="formularioregistro" action="actuuarios.jsp">
                    <br> 
                    <input type="text" value="<%=rs.getString("nombre") %>" name="name"  > 
                    <input type="text" value="<%=rs.getString("nacimiento")%> " name="naci">
                    <input type="text" value="<%=rs.getString("sexo")%> " name="sexo"> 
                    <input type="text" value="<%=rs.getString("eda")%> " name="edad"> 
                   
                    <button  class="btn btn-info btn-block compra_boton-color" >Actualizar</button>
                    <a href="borrarcuenta.jsp" style="color:black;">Eliminar mi cuenta</a>
                 
                 </form>

                <%     
                                
                            }
                            rs.close();
                            set.close();
                        String idS = String.valueOf(session.getAttribute("id")); 
                        
                            
                        
                        }catch(SQLException ed){
                            System.out.println("Error al consultar la tabla");
                            System.out.println(ed.getMessage());
                            %>
            </body>
            <h1>Recurso no disponible solo juguito contigo UwU</h1>
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
                
            </body>
        </table>
                    <br>
                  <a href='index.html?id=<%=session.getAttribute("id")%>ban=<%=session.getAttribute("ban")%>' >Regresar </a>
                  <div class="contenido-header">
                      </header>
        </div>
    </body>
</html>