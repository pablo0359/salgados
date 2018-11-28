<%-- 
    Document   : listar_cidade
    Created on : 28/11/2018, 19:21:44
    Author     : Mateus
--%>

<%@page import="modelo.Cidade"%>
<%@page import="modelo.CidadeDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript">
            function excluir(id,cidade){
                if(confirm("Tem certeza que deseja excluir a cidade: "+cidade+"?")){
                    window.open("excluir_produto.do?id="+id,"_parent");
                }
            }
        </script>
    </head>
    <body>
        <h1>Lista de cidades(<a href="form_inserir_cidade.jsp"><img src="imagens/novo.png"/></a>)</h1>
        <table border="1">
            <tr>
                <td>ID</td>
                <td>Cidade</td>
                <td>Taxa</td>
            </tr>
             <%
            ArrayList<Cidade> lista = new ArrayList<Cidade>();
            CidadeDAO cDAO = new CidadeDAO();
            try{
               lista = cDAO.listar();
            }catch(Exception e){
                out.print("Erro:"+e);
            }
            
            for(Cidade c:lista){
            %>
            <tr>
                <td><%=c.getId() %></td>
                <td><%=c.getCidade()%></td>
                <td><%=c.getTaxa()%></td>
            </tr>
             <td><a href="form_alterar_cidade.jsp?id=<%=c.getId() %>"><img src="imagens/alterar.png"/></a> <a href="#" onclick="excluir(<%=c.getId() %>,'<%=c.getCidade()%>')"><img src="imagens/excluir.png"/></a>  </td>
            
            </tr>
            <%
            }
            %>
    </body>
</html>
