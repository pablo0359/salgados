<%-- 
    Document   : salgado
    Created on : 29/11/2018, 02:54:32
    Author     : pablo
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.ProdutoDAO"%>
<%@page import="modelo.Produto"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="estilo.jsp" %>
    </head>
    <body>
<%@include file="menu_home.jsp" %>

<div class="w3-content wrapper" style="max-width:1200px;min-height: 100%;margin-bottom: 72px;">
  <div class="w3-row ">
    <%
        
            int id = Integer.parseInt(request.getParameter("idpro"));
          
            Produto pro = new Produto();
            ProdutoDAO pDAO = new ProdutoDAO();
            try{
               pro = pDAO.carregarPorId(id);
                
            }catch(Exception e){
                out.print("Erro:"+e);
            }
    
    %>    
      <div style="width:100%"> 
          
      <div class="row mb-2">
        <div class="col-md-6">
          <div class=" flex-md-row mb-4  h-md-250">
            <div class="card-body d-flex flex-column align-items-start">
              <img src="<%=pro.getImg() %>" style="width:100%">
            </div>            
          </div>
        </div>
        <div class="col-md-6" height="auto" >
          <div class="card flex-md-row mb-4 shadow-sm h-md-250">
            <div class="card-body d-flex flex-column align-items-start">
                    <p>
                        <h1><%=pro.getNome() %></h1><br>
                        <h3><b class="w3-text-red">R$<%=pro.getPreco() %> unidade</b></h3>
                    </p>
                    <div class="w3-display-container">                
                        
                        <form method="post" action="gerenciar_carrinho.do">
                         <input type="hidden" name="valor" value="<%=pro.getPreco()%>"/>
                         <input type="hidden" name="id_produto" value="<%=pro.getId() %>"/>
                         <input type="hidden" name="op" value="add"/>
                        </br></br>Quantidade<input type="text" name="quantidade" class="form-control" value="1" size="3"/></br>
                        <button type="submit" class="btn btn-success"><h2>Comprar </h2></button>
                        </br></br>
                        </form>
                        
                    </div>
            </div>            
          </div>
        </div>
      </div>
            <div style="width:100%">
              <table class="table">
                  <thead class="thead-light"><tr><td>NOME:</td><td> <%=pro.getNome() %> </td></tr></thead>
                <tr><td>SABOR:</td><td> <%=pro.getSabor() %>  </td></tr>
                <tr><td>INGREDIENTES:</td><td> <%=pro.getIngredientes() %>  </td></tr>
                <tr><td>DESCRIÇÃO:</td><td> <%=pro.getDescricao() %>  </td></tr>
                <tr><td>PESO:</td><td> <%=pro.getPeso() %> gramas  </td></tr>
                <tr><td>CLASSIFICAÇÃO:</td><td> <%=pro.getClassificacao().getTipo() %> </td> </tr>
                </table>
          </div>
      </div>
    
  </div>

            
</div >


<%@include file="rodape.jsp" %>


        
    </body>
</html>