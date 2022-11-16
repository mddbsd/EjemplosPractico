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
                String qCurs ="INSERT INTO tb_curs (curs_nom, curs_desc) VALUES (?,?); "
                            + "SET @id_curs= LAST_INSERT_ID(); "
                            + "INSERT INTO tb_curs_sede (id_tbcurs, id_tbsede) VALUES ((SELECT id_curs FROM tb_curs WHERE curs_nom=?),?)";
                //String qSet = "";
                //String qRel = "";
                PreparedStatement consultaCurs = null;
                //PreparedStatement consultaRel = null;
                //PreparedStatement consultaSet = null;
                String vId = request.getParameter("id");
                String vDesc = request.getParameter("desc");
                String vCurso = request.getParameter("curso");
               
                try {
                    conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/ejpractico", "root", "");
                    /*prepara curso*/
                    consultaCurs = conexion.prepareStatement(qCurs);
                    consultaCurs.setString(1, request.getParameter("curso"));
                    consultaCurs.setString(2, request.getParameter("desc"));
                    consultaCurs.setString(3, request.getParameter("id"));
                    /*preparar consulta set
                    consultaSet = conexion.prepareStatement(qSet);
                    /*pREPARA RELACION
                    consultaRel = conexion.prepareStatement(qRel);
                    consultaRel.setString(1, request.getParameter("id"));
*/
                    consultaCurs.execute();
                    //consultaSet.excute();
                    //consultaRel.execute();
                    
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
