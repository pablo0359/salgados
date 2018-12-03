<%-- 
    Document   : listar_classificacao
    Created on : 28/11/2018, 15:40:06
    Author     : Mateus
--%>

<%@page import="modelo.Classificacao"%>
<%@page import="modelo.ClassificacaoDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <script type="text/javascript">
            function excluir(id,tipo){
                if(confirm("Tem certeza que deseja excluir a classificacao: "+tipo+"?")){
                    window.open("excluir_classificacao.do?id="+id,"_parent");
                }
            }
        </script>
        <title>Listar Classificacao</title>
        <%@include file="estilo.jsp" %>
    </head>
    <body>
        <%@include file="menu.jsp" %>
        <div class="w3-content wrapper" style="max-width:1200px">
        <h1>Lista de Classificação (<a href="form_inserir_classificacao.jsp"><img src="imagens/novo.png"/></a>)</h1>
        <table border="1">
            <tr>
                <td>ID</td>
                <td>TIPO</td>
                <td>STATUS</td>
            </TR>
<%
            ArrayList<Classificacao> lista = new ArrayList<Classificacao>();
            ClassificacaoDAO cDAO = new ClassificacaoDAO();
            try{
               lista = cDAO.listar();
            }catch(Exception e){
                out.print("Erro:"+e);
            }
            
            for(Classificacao c:lista){
%>
        <tr>
                <td><%=c.getId() %></td>
                <td><%=c.getTipo()%></td>
                <td><% 
                        if(c.getStatus() == 1){
                            %> Ativo <% 
                        } else{
                        %> Desativado <%
                        }
                    %>
                <td><a href="form_alterar_classificacao.jsp?id=<%=c.getId() %>"><img src="imagens/alterar.png"/></a> <a href="#" onclick="excluir(<%=c.getId() %>,'<%=c.getTipo()%>')"><img src="imagens/excluir.png"/></a>  </td>
            </tr>            
            <%
            }
            %>
        </div>
    </body>
</html>
