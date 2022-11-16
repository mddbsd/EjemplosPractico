<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
                    <%
                Class.forName("com.mysql.jdbc.Driver");
                Connection conexion = null;            
                String qCurs ="DELETE FROM tb_curs_sede WHERE id_tbcurs=? AND id_tbsede=?";
                PreparedStatement eliminaCurs = null;
               
                try {
                    conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/ejpractico", "root", "");
                    /*prepara curso*/
                    eliminaCurs = conexion.prepareStatement(qCurs);
                    eliminaCurs.setString(1, request.getParameter("idprod"))
                    eliminaCurs.setString(2, request.getParameter("sucursal"));
                    eliminaCurs.execute();                
                    out.print("ELIMINADO");
                } catch (Exception e) {
                    e.printStackTrace();
                    out.println(consultaCurs + "</br>");
                    //out.println(consultaRel + "</br>");
                  
                } finally {
                    try {

                        //consultaRel.close();
                        eliminaCurs.close();
                        conexion.close();
                    } catch (Exception e) {
                    }
                }
            %>
    </body>
</html>