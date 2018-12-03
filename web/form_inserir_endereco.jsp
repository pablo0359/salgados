<%-- 
    Document   : form_inserir_endereco
    Created on : 28/11/2018, 19:06:18
    Author     : Mateus
--%>

<%@page import="modelo.ClienteDAO"%>
<%@page import="modelo.Cliente"%>
<%@page import="modelo.Cidade"%>
<%@page import="modelo.CidadeDAO"%>
<%@page import="java.util.ArrayList"%>
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
         <h1>Novo Endereço</h1>
        <form action="inserir_endereco.do" method="post">
            
            Logradouro<input  type="text" name="logradouro"  size="60" required/><br/>
            Uf:<input  type="text" name="uf"  size="60" required/><br/>
            Cep:<input  type="text" name="cep" size="60"  required/><br/>
            Pais:<input  type="text" name="pais" size="60" required/><br/>
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
        <option value="<%=c.getId() %>"><%=c.getTaxa()%></option>
              <% } %>
            </select></br>
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
              <option value="<%=ci.getId() %>"><%=ci.getNome()%></option>
              <% } %>
               </select></br>
               <input type="submit" value="Salvar"/>
        </form>
        </div>
    </body>
</html>
