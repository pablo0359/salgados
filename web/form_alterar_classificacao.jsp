<%-- 
    Document   : form_alterar_classificacao
    Created on : 28/11/2018, 15:00:48
    Author     : Mateus
--%>

<%@page import="modelo.ClassificacaoDAO"%>
<%@page import="modelo.Classificacao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
        Classificacao c = new Classificacao();
    try{
       int id = Integer.parseInt(request.getParameter("id"));
       ClassificacaoDAO cDAO = new ClassificacaoDAO();
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
        <%@include file="estilo.jsp" %>
    </head>
    <body>
        <%@include file="menu.jsp" %>
        <div class="w3-content wrapper" style="max-width:1200px">
       <h1>Editando Classificacao</h1>
        <form action="alterar_classificacao.do" method="post">
            ID:<%=c.getId() %><br/>
            <input type="hidden" value="<%=c.getId() %>" name="id"/>
            Tipo:    <input value="<%=c.getTipo()%>" type="text" name="tipo"  size="60" required/><br/>
            Status: <select name="status"  >
                <option value="1" <% if(c.getStatus() == 1){ %> selected   <% } %> >Ativo</option>
                    <option value="2"  <% if(c.getStatus() != 1){ %> selected   <% } %> >Desativo</option>
                    </select> <br/>
                      <input type="submit" value="Salvar"/>
        </form>
        </div>
    </body>
</html>
