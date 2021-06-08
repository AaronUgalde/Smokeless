
<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*, java.util.*, java.text.*, encapsulamiento.Logueo,  encapsulamiento.ConexionDB" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    </head>
    <body>
        
           
          
                
                <% 
                    
                    Connection con = null;
                    Statement set = null;
                    ResultSet rs = null;
                    Statement set1 = null;
                    ResultSet rs1 = null;
                    
                     ConexionDB db = new ConexionDB();
                db.url();   
                
                    
                    try{
                        
                        Class.forName(db.getDriver());
                        con = DriverManager.getConnection(db.getUrl(), db.getUserName(), db.getPassword());
                        try{
                            String usua, contrasena;
                            usua = request.getParameter("name");
                            contrasena = request.getParameter("contra");
                            
                            Logueo l1 = new Logueo(usua, contrasena);
                            
                            
                            String q = "select id_usua from bdcrear WHERE nombre='"+l1.getNombre()+"'and contrasena='"+l1.getContrasena()+"'";
                            set = con.createStatement();
                            rs = set.executeQuery(q);
                            
                            if(rs.isBeforeFirst())
                            {
                                while(rs.next()){
                             System.out.println(rs.getString("id_usua"));
                             session.setAttribute("id", rs.getString("id_usua"));
                             
                            String q1 = "select id_historial from hismed WHERE id_usua='"+rs.getString("id_usua")+"'";
                            set1 = con.createStatement();
                            rs1 = set.executeQuery(q1);
                            
                            String idS = String.valueOf(session.getAttribute("id")); 
                            Cookie miCookie = new Cookie ("id", String.valueOf(session.getAttribute("id")));
                            miCookie.setMaxAge(120);
                            response.addCookie(miCookie);
                       
                        
                                if(rs1.isBeforeFirst() && idS!=null)
                                {
                                    response.sendRedirect("menuinicial.jsp"); 
                                }
                                else   
                                {  
                                    
                                   

                                    response.sendRedirect("cuestionario.html"); 
                                     
                                }
                            }
                            
                                    
                      
                            rs.close();
                            set.close();
                            rs1.close();
                            set1.close();
                                
                            }
                            
                            
                            
                            else
                            {
                                 %> <script>
                                     
    
                                        var userval = confirm("Usuario o contraseña incorrectas, ¿desea registrarse?");
                                        if (userval ==true)
                                        {
                                            window.location.replace("crearusuario.html");
                                        }
                                        else 
                                        {
                                            window.location.replace("index.html");
                                        }
                                 </script> <%
                              
                            }
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
</html>