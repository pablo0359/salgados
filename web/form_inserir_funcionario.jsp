<%-- 
    Document   : form_inserir_funcionario
    Created on : 02/12/2018, 14:26:26
    Author     : Mateus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inserir Funcionario</title>
        <%@include file="estilo.jsp" %>
    </head>
    <body>
        <%@include file="menu.jsp" %>
        <div class="w3-content wrapper" style="max-width:1200px">
        <h1>Novo Funcionario</h1>
        <form action="inserir_funcionario.do" method="post">
            
            Nome:<input type="text" name="nome"  size="60" /><br/>
            Login:<input type="text" name="login" size="60" /><br/>
            Status: <select name="status"  required>
                    <option value="1">Ativo</option>
                    <option value="2">Desativo</option>
                    </select> <br/>
            Senha:<input type="text" name="senha" size="60"/><br/>
            CPF:<input type="text" name="cpf"  size="60" /><br/>
            cargo:<input type="text" name="cargo"  size="60" /><br/>
            Rg:<input type="password" name="rg"  size="60" /><br/>
            email:   <input type="text" name="email"  size="60"/><br/> 
            Telefone:<input type="text" name="tel"  size="60" /><br/>
            Endereco:<input type="text" name="tel"  size="60" /><br/>
            Perfil:<input type="text" name="tel"  size="60" /><br/>
            <br/>
            <input type="submit" value="Salvar"/>
            
            
        </form>
        </div>
    </body>
</html>
