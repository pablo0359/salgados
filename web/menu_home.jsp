<%-- 
    Document   : menu_home
    Created on : 28/11/2018, 15:26:28
    Author     : pablo
--%>

<%@page import="modelo.Item"%>
<%@page import="modelo.Venda"%>
<%@page import="modelo.Menu"%>
<%@page import="modelo.Cliente"%>
<%@page import="modelo.ClassificacaoDAO"%>
<%@page import="modelo.Classificacao"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

    
        

    <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
            <a class="navbar-brand" href="index.jsp">Salgados Banderantes</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <ul class="navbar-nav mr-auto">
                  <li class="nav-item active">
                    <a class="nav-link" href="index.jsp"">Home <span class="sr-only">(atual)</span></a>
                  </li>
                  <%
            ArrayList<Classificacao> lista = new ArrayList<Classificacao>();
            ClassificacaoDAO cDAO = new ClassificacaoDAO();
            try{
               lista = cDAO.listarAtivos();
            }catch(Exception e){
                out.print("Erro:"+e);
            }
            for(Classificacao c:lista){
                %>
                  <li class="nav-item">
                      <a class="nav-link" href="produto_classificado.jsp?clas=<%=c.getId() %>"><%=c.getTipo() %></a>
                  </li>
                <% } %>  
                  
                </ul>
                <%
                    
                    try{
                        Venda venda = new Venda();
                        venda = (Venda) session.getAttribute("venda");
                        Cliente uLogado = (Cliente) session.getAttribute("cliente");
                        
                        
                                           
                        out.print("  Bem-vindo <a class='nav-link' href='Conta.jsp'>"+uLogado.getNome()+"</a> </br><a class='nav-link' href='sair.jsp'> Sair</a> <a class='nav-link' href='form_fecha_carrinho.jsp'><img src='imagens/carrinho.png'/> ");
                        %> <%=venda.getCarrinho().size() %></a> <%
                    }catch(Exception e){%>
                        <form class="form-inline mt-2 mt-md-0" action="login.jsp">
                            <button class="btn btn-light btn-secondary " type="submit">Logar</button>
                        </form> <% 
                    }  

                  %>
            </div>
        </nav>
        
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery-slim.min.js"><\/script>')</script>
    <script src="../../assets/js/vendor/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
  

