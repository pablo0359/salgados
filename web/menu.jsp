<%-- 
    Document   : menu
    Created on : 03/10/2018, 16:41:16
    Author     : Administrador
--%>

<%@page import="modelo.Menu"%>
<%@page import="modelo.Funcionario"%>


<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
            <a class="navbar-brand" href="index.jsp">Salgados Banderantes</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <ul class="navbar-nav mr-auto">
                  <li class="nav-item active">
                    <a class="nav-link" href="index.jsp">Home <span class="sr-only">(atual)</span></a>
                  </li>
                  <%
            Funcionario uLogado = (Funcionario) session.getAttribute("funcionario");
            try{
            for(Menu mu:uLogado.getPerfil().getMeusMenus()){                
                out.print("<li class='nav-item'><a class='nav-link' href='"+mu.getLink()+"'>"+mu.getTitulo() +"</a></li>"); 
            } 
            }catch(Exception e){
                        out.print(e +"menu com erros");
                    }
                  
                out.print("</ul>");
               
                    
                    try{
  
      
                        out.print("  Bem-vindo "+uLogado.getNome()+"(<a href='sair.jsp'>Sair</a>)");
                    }catch(Exception e){
                        response.sendRedirect("login.jsp");
                    }

                  %>
            </div>
        </nav>
        
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery-slim.min.js"><\/script>')</script>
    <script src="../../assets/js/vendor/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>