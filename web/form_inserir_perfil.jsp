<%-- 
    Document   : form_inserir_perfil
    Created on : 07/08/2018, 16:25:29
    Author     : Administrador
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inserir Perfil</title><%@include file="estilo.jsp" %>
    </head>
    <body>
        <%@include file="menu.jsp" %>
        <div class="w3-content wrapper" style="max-width:1200px">
        <%--@include file="menu.jsp" --%>
        <h1>Novo Perfil</h1>
        <form action="inserir_perfil.do" method="post">
            Nome:<input type="text" name="nome" size="60" required/><br/>
            Descrição:<input type="text" name="descricao" size="60" required/><br/>
            <input type="submit" value="Salvar"/>
        </form>
        </div>
    </body>
</html>
