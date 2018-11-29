<%-- 
    Document   : listarEndereco
    Created on : 28/11/2018, 19:29:41
    Author     : Mateus
--%>

<%@page import="modelo.Cliente"%>
<%@page import="modelo.ClienteDAO"%>
<%@page import="modelo.Cidade"%>
<%@page import="modelo.CidadeDAO"%>
<%@page import="modelo.Endereco"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.EnderecoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <script type="text/javascript">
            function excluir(id,logradouro){
                if(confirm("Tem certeza que deseja excluir o endereco: "+logradouro+"?")){
                    window.open("excluir_endereco.do?id="+id,"_parent");
                }
            }
        </script>
    </head>
    <body>
        <h1>Lista de Endereço (<a href="form_inserir_endereco.jsp"><img src="imagens/novo.png"/></a>)</h1>
        <table border="1">
            <tr>
                <td>ID</td>
                <td>LOGRADOURO</td>
                <td>UF</td>
                <td>CEP</td>
                <td>PAIS</td>
            </TR>
            <%
            ArrayList<Endereco> lista = new ArrayList<Endereco>();
            EnderecoDAO eDAO = new EnderecoDAO();
            try{
               lista = eDAO.listar();
            }catch(Exception e){
                out.print("Erro:"+e);
            }
            
            for(Endereco e:lista){
            %>
            <tr>
                <td><%=e.getId() %></td>
                <td><%=e.getLogradouro()%></td>
                <td><%=e.getUf()%></td>
                <td><%=e.getCep()%></td>
                <td><%=e.getCidade()%></td>
            
            <td><%
                CidadeDAO cDAO = new CidadeDAO();
                Cidade c = new Cidade();
                    c = cDAO.carregarPorId(e.getCidade().getId()); %>   
                    <%=c.getCidade()%></td>
           <td><a href="form_alterar_endereco.jsp?id=<%=e.getId() %>"><img src="imagens/alterar.png"/></a> <a href="#" onclick="excluir(<%=c.getId() %>,'<%=c.getCidade()%>')"><img src="imagens/excluir.png"/></a>  </td>
                <td><%
                 ClienteDAO ccDAO = new ClienteDAO();
                    Cliente cc = new Cliente();
                    cc = ccDAO.carregarPorId(e.getCliente().getId()); %>   
                    <%=cc.getNome()%></td>
           <td><a href="form_alterar_endereco.jsp?id=<%=e.getId() %>"><img src="imagens/alterar.png"/></a> <a href="#" onclick="excluir(<%=cc.getId() %>,'<%=cc.getNome()%>')"><img src="imagens/excluir.png"/></a>  </td>
            
            </tr>    
            <%
            }
            %>
    </body>
</html>
