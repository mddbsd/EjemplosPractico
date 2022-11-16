<%-- 
    Document   : index1-elimina
    Created on : 16 nov. 2022, 10:58:30
    Author     : COMPU06
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <p>Ingrese codigo del producto a eliminar</p>
        <form method="post" action="idex1-elimina-op.jsp">
            <input type="text" name="idprod">
            <input type="hidden" name="sucursal" value="<%out.print(request.getParameter("id"));%>">
        </form>
    </body>
</html>
