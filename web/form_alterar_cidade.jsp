<%-- 
    Document   : AlterarCidade
    Created on : 28/11/2018, 19:00:25
    Author     : Mateus
--%>

<%@page import="modelo.CidadeDAO"%>
<%@page import="modelo.Cidade"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Cidade c = new Cidade();
    try{
       int id = Integer.parseInt(request.getParameter("id"));
       CidadeDAO cDAO = new CidadeDAO();
       c = cDAO.carregarPorId(id);
       
       
    }catch(Exception e){
        out.print("Erro:"+e);
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <h1>Editando Cidade</h1>
        <form action="alterar_cidade.do" method="post">
            ID:<%=c.getId() %><br/>
            <input type="hidden" value="<%=c.getId() %>" name="id"/>
            Cidade: <input value="<%=c.getCidade()%>" type="text" name="cidade"  size="60" required/><br/>
            Taxa:<input value="<%=c.getTaxa()%>" type="text" name="taxa"  size="60" required/><br/>
       <input type="submit" value="Salvar"/>
        </form>
    </body>
</html>
