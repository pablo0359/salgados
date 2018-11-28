<%-- 
    Document   : form_alterar_endereco
    Created on : 28/11/2018, 18:29:40
    Author     : Mateus
--%>

<%@page import="modelo.ClienteDAO"%>
<%@page import="modelo.Cliente"%>
<%@page import="modelo.Cidade"%>
<%@page import="modelo.CidadeDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.EnderecoDAO"%>
<%@page import="modelo.Endereco"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Endereco end = new Endereco();
    try{
       int id = Integer.parseInt(request.getParameter("id"));
       EnderecoDAO eDAO = new EnderecoDAO();
       end = eDAO.carregarPorId(id);
       
       
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
         <h1>Editando Endereço</h1>
        <form action="alterar_endereco.do" method="post">
            ID:<%=end.getId() %><br/>
            <input type="hidden" value="<%=end.getId() %>" name="id"/>
            Logradouro<input value="<%=end.getLogradouro()%>" type="text" name="Logradouro"  size="60" required/><br/>
            Uf:<input value="<%=end.getUf()%>" type="text" name="uf"  size="60" required/><br/>
            Cep:<input value="<%=end.getCep()%>" type="text" name="cep" size="60"  required/><br/>
            Pais:<input value="<%=end.getPais()%>" type="text" name="pais" size="60" required/><br/>
            Cidade: <select name="cidade" >    
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
          option value="<%=c.getId() %>" <% if(end.getCidade().getId() == c.getId()){ %> selected   <% } %>><%=c.getTaxa()%></option>
              <% } %>
              </select><br/>
              Cliente: <select name="cliente" >
              <%
            ArrayList<Cliente> lista1 = new ArrayList<Cliente>();
            ClienteDAO ciDAO = new ClienteDAO();
            try{
               lista1 = ciDAO.listar();
            }catch(Exception e){
                out.print("Erro:"+e);
            }
            for(Cliente ci:lista1){
                %>  
            <option value="<%=ci.getId() %>" <% if(end.getCliente().getId() == ci.getId()){ %> selected   <% } %>><%=ci.getNome()%></option>
              <% } %>
              </select><br/>
                <input type="submit" value="Salvar"/>
              </select
        </form>
           
      
        </body>
</html>
