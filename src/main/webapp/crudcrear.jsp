<%-- 
    Document   : crudcrear
    Created on : 24/05/2021, 07:39:14 PM
    Author     : yayah
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*, java.util.*, java.text.*, encapsulamiento.Crear, encapsulamiento.ConexionDB" %>
<!DOCTYPE html>
<link rel="stylesheet" href="./css/respuestsas.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Assistant:wght@300&display=swap" rel="stylesheet">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro de Usuarios</title>
    </head>
    <body>
     <header> 
        <h1>SMOKELESS</h1>
        </header>
        <br>
        <% 
            Connection con = null;
            Statement set = null;
            ResultSet rs = null;
           
            try{
                
                ConexionDB db = new ConexionDB();
                db.url();   
                Class.forName(db.getDriver());
                con = DriverManager.getConnection(db.getUrl(), db.getUserName(), db.getPassword());
                
                try{
                    String nombre,fec,contrasena,se,eda, q;
                    nombre = request.getParameter("name");
                    contrasena = request.getParameter("contra");
                    fec= request.getParameter("nacimiento");
                    se = request.getParameter("sexo");
                    eda= request.getParameter("edad");
                    System.out.println(nombre);
                    System.out.println("dasdasd");
                    
                    Crear c1 = new Crear(nombre, contrasena, fec, se, eda); 
                    set = con.createStatement();
                    
                    q = "insert into bdcrear(nombre,contrasena,nacimiento,sexo,eda) "
                            + "values ('"+c1.getNombre()+"', '"+c1.getContrasena()+"','"+c1.getNacimiento()+"','"+c1.getSexo()+"','"+c1.getEdad()+"')";
                    int registro = set.executeUpdate(q);
                    
                    %>
        <div class="content">
        <h1>Registro Exitoso</h1> 
        </div>     
        <br>
                    <%
                        set.close();
                
                }catch(SQLException ed){
                    System.out.println("Error al registrar en la tabla");
                    System.out.println(ed.getMessage());
                    %>
        <h1>Registro No Exitoso, error en la lectura de la tabla</h1>            
                    <%
                
                }
                con.close();
            
            }catch(Exception e){
                System.out.println("Error al conectar la bd");
                System.out.println(e.getMessage());
                System.out.println(e.getStackTrace());
            %>
        <h1>Sitio en Construcción</h1>            
                    <%
            }
            %>
        
            <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
            <a href="index.html" id="rm">Regresar al menú principal</a>
        
    </body>
</html>
