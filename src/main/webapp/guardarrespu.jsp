<%-- 
    Document   : crudcrear
    Created on : 24/05/2021, 07:39:14 PM
    Author     : yayah
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*, java.util.*, java.text.*, encapsulamiento.Crear, encapsulamiento.ConexionDB, encapsulamiento.Crear, encapsulamiento.ConexionDB" %>
<!DOCTYPE html>
<link rel="stylesheet" href="./css/respuestsas.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Assistant:wght@300&display=swap" rel="stylesheet">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >
        <title>Registro de Respuestas</title>
    </head>
    <body>
    <header> 
        <h1>SMOKELESS</h1>
        <div class="contenido-header">
        <a href="menuinicial.jsp" id="menu">MENU</a>
        <a href="datosUsua.jsp" id="cue">CUENTA</a>
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
                    
                    String preg4,preg5,preg6,preg8,preg10,preg12,preg13,preg14,preg18,preg20,preg22,preg24,preg25,preg26,preg27,preg28,preg29, q;
                   
                   
                    preg4 = request.getParameter("preg4");
                    preg29= request.getParameter("preg29");
                    preg5 = request.getParameter("preg5");
                    preg6 = request.getParameter("preg6");
                    preg8 = request.getParameter("preg8");
                    preg10 = request.getParameter("preg10");
                    preg12= request.getParameter("preg12");
                    preg13= request.getParameter("preg13");
                    preg14= request.getParameter("preg14"); 
                    preg18= request.getParameter("preg18"); 
                    preg22= request.getParameter("preg22"); 
                    preg24= request.getParameter("preg24");
                    preg25= request.getParameter("preg25");
                    preg26= request.getParameter("preg26");
                    preg27= request.getParameter("preg27");
                    preg28= request.getParameter("preg28");
                    preg20= request.getParameter("preg20");
                    set = con.createStatement();
                    String idS = String.valueOf(session.getAttribute("id")); 
                    q = "insert into hismed(id_usua, obesidad, diabetes, fum_pasivo ,gases ,qumicos,subsuelo, alcohol,infeccion, sirugia,imune, hepatitis, sirrosis, graso,hierro,asma,anos_Fum, alergia) "
                            + "values ('"+idS+"','"+preg5+"', '"+preg6+"','"+preg8+"' ,'"+preg10+"', '"+preg12+"', '"+preg13+"', '"+preg14+"', '"+preg18+"', '"+preg20+"', '"+preg22+"', '"+preg24+"', '"+preg25+"', '"+preg26+"', '"+preg27+"', '"+preg28+"', '"+preg4+"', '"+preg29+"')";
                    System.out.println("prueba:  " +q );
                    int registro = set.executeUpdate(q);

                   
                  
                    %>
                    <div class="content">
                    <h1>Registro Exitoso</h1> 
                    </div>           
                    <%
                        set.close();
                
                }catch(SQLException ed){
                    System.out.println("Error al registrar en la tabla");
                    System.out.println(ed.getMessage());
                    %>
                    <div class="content">
                    <h1>Registro No Exitoso, error en la lectura de la tabla</h1>       
                    </div>
                    <%
                
                }
                con.close();
            
            }catch(Exception e){
                System.out.println("Error al conectar la bd");
                System.out.println(e.getMessage());
                System.out.println(e.getStackTrace());
            %>
       <div class="content">
            <h1>Sitio en Construcción</h1>         
       </div>
                    <%
            }
            %>
        
         <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
            <a href="cuestionarioDiario.html" id="s">Realiza el sugundo cuestionario porfavor :3</a>
        
    </body>
</html>
