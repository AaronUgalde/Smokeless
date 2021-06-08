<%-- 
    Document   : menuinicial
    Created on : 4/06/2021, 11:26:53 PM
    Author     : Aaron
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*, java.util.*, java.text.*, encapsulamiento.Logueo,  encapsulamiento.ConexionDB" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="./css/index.css">
        <link rel="stylesheet" href="./css/hola.css">
        <link rel="stylesheet" href="./css/menu.css">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Assistant:wght@300&display=swap" rel="stylesheet">
        </head>
    <body>
        <div class="contenido-header">
            <header>                        
                <a href="datosUsua.jsp"><h1>Cambia Tus Datos Ahora</h1></a>
                <a href="cuestionarioDiario.html"><h1>Contestar cuestionario diario</h1></a>
                <a href="https://smokelesspy.herokuapp.com/home/<%=session.getAttribute("id")%>" style="color:black;">Hacer Tu prediccion </a>
                <%
                    Cookie[] cookies = request.getCookies();
                    for (int i = 0; i < cookies.length; i++)
                        if (cookies[i].getName().equals("id"))
                            session.setAttribute("id",cookies[i].getValue());
                %>
            </header>
        </div>
    </body>
</html>
