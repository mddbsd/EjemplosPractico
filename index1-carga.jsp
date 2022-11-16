<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>

<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <%
                Class.forName("com.mysql.jdbc.Driver");
                Connection conexion = null;            
                String qSedes ="SELECT sede_sponsor from tb_sede WHERE id_sede=?";   
                PreparedStatement consultaSponsor = null;
                ResultSet listaSponsor = null;
                try {
                    conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/ejpractico", "root", "");
                    consultaSponsor = conexion.prepareStatement(qSedes);
                    consultaSponsor.setString(1, request.getParameter("id"));
                    listaSponsor = consultaSponsor.executeQuery();
                    listaSponsor.next();    
        %>
    <body>
        <h1><%out.print(listaSponsor.getString("sede_sponsor"));%><h1>
        <form method="post" action="index1-carga-op.jsp">
            NOMBRE CURSO:<input type="text" name="curso"><br>
            DESCRIPCION: <input type="text" name="desc"><br>
            <input type="hidden" name="id" value="<%out.print(request.getParameter("id"));%>">
            <input type="submit" value="CARGAR">
        </form>
    </body>
    <%
        } catch (Exception e) {
                    e.printStackTrace();
                    /*out.println("exepcion </br>");
                    out.println("detalle de la consulta: </br>");*/

                } finally {
                    try {                                     
                        consultaSponsor.close();
                        conexion.close();
                    } catch (Exception e) {
                    }
                }
    %>
</html>
