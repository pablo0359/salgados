<%-- 
    Document   : login
    Created on : 03/10/2018, 16:10:37
    Author     : Administrador
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br"><head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="/favicon.ico">

    <title>Login</title>

    <!-- Principal CSS do Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Estilos customizados para esse template -->
    <link href="css/floating-labels.css" rel="stylesheet">
  </head>

  <body>
     
    <form class="form-signin" action="valida_login.do" method="post">
      <div class="text-center mb-4">
        <img class="mb-4" src="imagens/hamburger.svg" alt="" width="72" height="72">
        <h1 class="h3 mb-3 font-weight-normal">Salgados </br>Bandeirantes</h1>
        
      </div>

      <div class="form-label-group">
        <input type="email" name="login" id="inputEmail" class="form-control" placeholder="Endereço de email" required="" autofocus="">
        <label for="inputEmail">Endereço de email</label>
      </div>

      <div class="form-label-group">
        <input type="password" name="senha" id="inputPassword" class="form-control" placeholder="Senha" required="">
        <label for="inputPassword">Senha</label>
      </div>

      <div class="checkbox mb-3">
        <label>
          <input type="checkbox" value="lembrar de mim"> Lembrar de mim
        </label>
      </div>
      <button class="btn btn-lg btn-primary btn-block" type="submit">Entrar</button>
      <p class="mt-5 mb-3 text-muted text-center"><a href="login_funcionario.jsp" class="nav-link">Funcionario</a></br>©2018</p>
    </form>
  

</body></html>
