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
                String qCurs ="select tb_curs.curs_nom AS curso,"
                            + "       tb_sede.sede_nom AS sede"
                            + " FROM tb_curs_sede "
                            + "    JOIN tb_curs ON tb_curs_sede.id_tbcurs=tb_curs.id_curs"
                            + "    JOIN tb_sede ON tb_curs_sede.id_tbsede= tb_sede.id_sede"
                            + "        AND tb_sede.id_sede = ?";
                PreparedStatement consultaCurs = null;
               
                try {
                    conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/ejpractico", "root", "");
                    /*prepara curso*/
                    consultaCurs = conexion.prepareStatement(qCurs);
                    consultaCurs.setString(1, request.getParameter("id"));
                    ResultSet listaCurs = consultaCurs.executeQuery();
                    while (listaCurs.next()){
                        %>
                        <ul>
                            <li><%out.print(listaCurs.getString("curso"));%></li>
                        </ul>
                        <%
                    }
                   
                    
                    out.print("cargado");
                } catch (Exception e) {
                    e.printStackTrace();
                    out.println(consultaCurs + "</br>");
                    //out.println(consultaRel + "</br>");
                  
                } finally {
                    try {

                        //consultaRel.close();
                        consultaCurs.close();
                        conexion.close();
                    } catch (Exception e) {
                    }
                }
            %>
    </body>
</html>