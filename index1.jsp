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
        <h1>CENTRO DE FORMACION</h1>
        <%
                Class.forName("com.mysql.jdbc.Driver");
                Connection conexion = null;            
                String qSedes ="SELECT * from tb_sede ";   
                PreparedStatement consultaSedes = null;
                ResultSet listaSedes = null;
                try {
                    conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/ejpractico", "root", "");
                    consultaSedes = conexion.prepareStatement(qSedes);
                    listaSedes = consultaSedes.executeQuery();
                    while(listaSedes.next()){
                        %>
                            <p>sede: <%out.print(listaSedes.getString("sede_nom"));%></p>
                            <ul>
                                <li><a href="index1-carga.jsp?id=<%out.print(listaSedes.getString("id_sede"));%>">carga</a></li>
                                <li><a href="index1-muestra.jsp?id=<%out.print(listaSedes.getString("id_sede"));%>">muestra</a></li>
                                <li><a href="index1-elimina.jsp?id=<%out.print(listaSedes.getString("id_sede"));%>">elimina</li>
                            </ul>                          
                        <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    /*out.println("exepcion </br>");
                    out.println("detalle de la consulta: </br>");*/

                } finally {
                    try {
                    
                        listaSedes.close();
                        consultaSedes.close();
                    } catch (Exception e) {
                    }
                }
        %>
    </body>
</html>
