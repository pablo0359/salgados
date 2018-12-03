<%-- 
    Document   : form_listar_cliente
    Created on : 29/10/2018, 05:21:37
    Author     : sajsm
--%>

<%@page import="modelo.ClienteDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%-- Scrpt para confirmar a exclusão do cliente --%>
        <script type="text/javascript">
            function excluir(id,nome){
                if(confirm("Tem certeza que deseja excluir o Cliente "+nome+"?")){
                    window.open("excluir_cliente.do?id="+id,"_parent");
                }
            }
        </script>
        <title>Lista de Clientes</title>
        <%@include file="estilo.jsp" %>
    </head>
    <body>
        <%@include file="menu.jsp" %>
        <div class="w3-content wrapper" style="max-width:1200px">
        <h1>Lista de Clientes (<a href="form_inserir_cliente.jsp">Adicionar Cliente</a>)</h1>
        <table border="1">
            <tr>
                <td>Nome</td>
                <td>Telefone</td>
                <td>CPF</td>
                <td>RG</td>
                <td>Email</td>
                <td>OPÇÕES</td>
            </tr>
            <% 
            ArrayList<Cliente> lista = new ArrayList<Cliente>();
            ClienteDAO cDAO = new ClienteDAO();
            try{
               lista = cDAO.listar();
            }catch(Exception e){
                out.print("Erro:"+e);
            }
            
            for(Cliente c:lista){
            %>
            <tr>
                <td><%=c.getNome()%></td>
                <td><%=c.getTelefone()%></td>
                <td><%=c.getCpf() %></td>
                <td><%=c.getRG() %></td>
                <td><%=c.getEmail() %></td>
                <td><a href="form_alterar_cliente.jsp?id=<%=c.getId() %>">Alterar</a> <a href="#" onclick="excluir(<%=c.getId() %>,'<%=c.getNome() %>')">Excluir</a> </td>
            </tr> 
            <%
            }
            %>
        </table>
        </div>
    </body>
</html>
