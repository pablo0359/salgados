<%-- 
    Document   : form_inserir_cidade
    Created on : 28/11/2018, 19:17:07
    Author     : Mateus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="estilo.jsp" %>
    </head>
    <body>
        <%@include file="menu.jsp" %>
        <div class="w3-content wrapper" style="max-width:1200px">
        <h1>Nova Cidade</h1>
        <form action="inserir_cidade.do" method="post">
            
            Cidade<input  type="text" name="cidade"  size="60" required/><br/>
            Taxa:<input  type="text" name="taxa"  size="60" required/><br/>
            
             <input type="submit" value="Salvar"/>
        </form>
        </div>
    </body>
</html>
