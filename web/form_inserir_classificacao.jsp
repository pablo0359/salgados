<%-- 
    Document   : form_inserir_classificacao
    Created on : 28/11/2018, 15:26:51
    Author     : Mateus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inserir Classificacao</title>
        <%@include file="estilo.jsp" %>
    </head>
    <body>
        <%@include file="menu.jsp" %>
        <div class="w3-content wrapper" style="max-width:1200px">
        <h1>Nova Classificacao</h1>
        <form action="inserir_classificacao.do" method="post">
            
            Tipo:    <input type="text" name="tipo"  size="60" required/><br/>
            Status: <select name="status"  required>
                    <option value="1">Ativo</option>
                    <option value="2">Desativo</option>
                    </select> <br/>
                    <input type="submit" value="Salvar"/>
        </form>
        </div>
    </body>
</html>
