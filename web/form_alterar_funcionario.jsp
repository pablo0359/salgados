<%-- 
    Document   : form_alterar_funcionario
    Created on : 02/12/2018, 14:11:09
    Author     : Mateus
--%>

<%@page import="modelo.FuncionarioDAO"%>
<%@page import="modelo.Funcionario"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ArrayList<Funcionario> funcionarios = new ArrayList<Funcionario>();
    Funcionario f = new Funcionario();
    try{
       int id = Integer.parseInt(request.getParameter("id"));
       FuncionarioDAO fDAO = new FuncionarioDAO();
       f = fDAO.carregarPorId(id);
       
       
       FuncionarioDAO pDAO = new FuncionarioDAO();
       funcionarios = fDAO.listar();
    }catch(Exception e){
        out.print("Erro:"+e);
    }
%>

<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Funcionario</title>
        <%@include file="estilo.jsp" %>
    </head>
    <body>
        <%@include file="menu.jsp" %>
        <div class="w3-content wrapper" style="max-width:1200px">
        <h1>Editando Funcionario</h1>
        <form action="alterar_funcionario.do" method="post">
            ID:<%=f.getId() %><br/>
            <input type="hidden" value="<%=f.getId() %>" name="id"/>
            Nome:<input type="text" name="nome" value="<%=f.getNome() %>" size="60" /><br/>
            Status: <select name="status"  >
                <option value="1" <% if(f.getStatus() == 1){ %> selected   <% } %> >Ativo</option>
                    <option value="2"  <% if(f.getStatus() != 1){ %> selected   <% } %> >Desativo</option>
                    </select> <br/>
            Senha:<input type="text" name="senha" value="<%=f.getSenha()%>" size="60"/><br/>
            CPF:<input type="text" name="cpf" value="<%=f.getCpf() %>" size="60" /><br/>
            Rg:<input type="password" name="rg" value="<%=f.getRg()%>" size="60" /><br/>
            email:   <input type="text" name="email" value="<%=f.getEmail() %>" size="60"/><br/> 
            Telefone:<input type="text" name="tel" value="<%=f.getTelefone() %>" size="60" /><br/>
            Endereco:<input type="text" name="tel" value="<%=f.getEndereco()%>" size="60" /><br/>
            Perfil:<input type="text" name="tel" value="<%=f.getPerfil()%>" size="60" /><br/>
            <br/>
            <input type="submit" value="Salvar"/>
        </form>
        </div>
    </body>
</html>
