<%-- 
    Document   : form_fecha_carrinho
    Created on : 07/11/2018, 13:27:28
    Author     : Administrador
--%>
<%@page import="modelo.Cliente"%>
<%@page import="modelo.Item"%>
<%@page import="modelo.Venda"%>
<%
Venda v = new Venda();
try{
   v = (Venda) session.getAttribute("venda");
}catch(Exception e ){
    out.print("Erro:"+e);
}

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Fecha Carrinho</title>
        <%@include file="estilo.jsp" %>
    </head>
    <body>
        
            <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
            <a class="navbar-brand" href="index.jsp">Salgados Banderantes</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <ul class="navbar-nav mr-auto">
                  <li class="nav-item active">
                    <a class="nav-link" href="index.jsp"">Home <span class="sr-only"></span></a>
                  </li>
                  
                </ul>
                <%
                        Cliente uLogado = (Cliente) session.getAttribute("cliente");
                        
                        
                                           
                        out.print("  Bem-vindo "+uLogado.getNome()+"</br><a class='nav-link' href='sair.jsp'> Sair</a> <a class='nav-link' href='form_fecha_carrinho.jsp'><img src='imagens/carrinho.png'/> ");
                        %> <%=v.getCarrinho().size() %></a> <%
                     

                  %>
            </div>
        </nav>
        
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery-slim.min.js"><\/script>')</script>
    <script src="../../assets/js/vendor/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
        
        
        
        <div class="w3-content wrapper" style="max-width:1200px">
        <h1>Venda</h1>
        ID:<%=v.getCliente().getId() %> Cliente:<%=v.getCliente().getNome() %><br/><br/>
        
        <h2>Itens no carrinho</h2>
        <table class="table">
            <tr>
                <td>ORD</td>
                <td>Produto</td>
                <td>QTD</td>
                <td>Preço</td>
                <td>Sub Total</td>
                <td>Remover</td>
            </tr>
            <%
            int i=0;
            double total=0;
            for(Item item:v.getCarrinho()){
                total=total+(item.getQuantidade()*item.getPreco());
            %>
            <tr>
                <td><%=i+1 %></td>
                <td><%=item.getProduto().getNome() %></td>
                <td><%=item.getQuantidade() %></td>
                <td>R$ <%=item.getPreco()%></td>
                <td>R$ <%=(item.getQuantidade()*item.getPreco()) %></td>
                <td align="center"><a href="gerenciar_carrinho.do?op=del&ord=<%=i %>">X</a></td>
            </tr>
            <%
                i++;
            }
            %>
        </table>
        <br/>
        VALOR TOTAL ==========> R$ <%=total %> 
        <br/><br/>
        <div class="btn-group" role="group" aria-label="Exemplo básico">
        <a href="listar_cliente.jsp"class="btn btn-secondary"><input type="submit" class="btn btn-secondary"value="Cancelar"/></a>
        <a href="index.jsp"class="btn btn-secondary"><input type="submit"  class="btn btn-secondary"value="Continuar comprando"/></a>  
        <a href="finalizar_venda.do"class="btn btn-secondary"><input type="submit" class="btn btn-secondary" value="Concluir"/></a>
    </div>
        </br></br>
        </div>
        <%@include file="rodape.jsp" %>
    </body>
</html>
