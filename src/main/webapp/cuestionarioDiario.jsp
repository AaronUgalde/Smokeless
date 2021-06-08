<%-- 
    Document   : cuestionarioDiario
    Created on : 30/05/2021, 10:56:55 PM
    Author     : yayah
--%>
    
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*, java.util.*, java.text.*, encapsulamiento.Crear, encapsulamiento.ConexionDB, encapsulamiento.Crear, encapsulamiento.ConexionDB"%>
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
        <title>Cuestionario Diario</title>
    </head>
    <body>
    <header> 
        <h1>SMOKELESS</h1>
        <div class="contenido-header">
        <a href="menuinicial.jsp" id="menu">MENU</a>
        <a href="https://smokelesspy.herokuapp.com/home/<%=session.getAttribute("id")%>">PROYECTAR</a>
        <a href="login.html"></a></div></header>
        
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
            String preg1,preg2,preg3,preg4,preg5,preg6,preg7,preg8,preg9,q;
                    preg1 = request.getParameter("preg1");
                    preg2 = request.getParameter("preg2");
                    preg3 = request.getParameter("preg3");
                    
                    
                    preg4 = request.getParameter("preg4");
                   
                    preg5 = request.getParameter("preg5");
                   
                    preg6= request.getParameter("preg6");
                    
                    preg7= request.getParameter("preg7");
                    preg8= request.getParameter("preg8");
                    preg9= request.getParameter("preg9");

                    set = con.createStatement();
                    String idS = String.valueOf(session.getAttribute("id")); 
                    
                    q = "insert into cuestionarios(n_cigarros, frec_humo ,horas_amb ,frec_alcohol,cons_alcohol, frutas_dia,falta_sangre, cons_med, cons_drog, id_usu) "
                            + "values ('"+preg1+"', '"+preg2+"','"+preg3+"', '"+preg4+"', '"+preg5+"', '"+preg6+"', '"+preg7+"', '"+preg8+"', '"+preg9+"', '"+idS+"')";
                    System.out.println("prueba:  " +q );
                    int registro = set.executeUpdate(q);

                   
                  
                    %>
         <div class="content">
                    <h1>Registro Exitoso</h1> 
                    </div>           
                    <%
                       
                        if(idS!=null)
                        {
                        response.sendRedirect("menuinicial.jsp"); 
                        }
                        else
                        {
                            response.sendRedirect("login.html"); 
                        }
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
        
        
            

    </body>
</html>
