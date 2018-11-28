<%-- 
    Document   : produtos
    Created on : 28/11/2018, 21:05:36
    Author     : pablo
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="modelo.ProdutoDAO"%>
<%@page import="modelo.Produto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!-- Product grid -->
  <div class="w3-row w3-grayscale">
    <%
            ArrayList<Produto> lista = new ArrayList<Produto>();
            ProdutoDAO pDAO = new ProdutoDAO();
            try{
               lista = pDAO.listar();
            }catch(Exception e){
                out.print("Erro:"+e);
            }
            
            for(Produto p:lista){
            %>

    <div class="w3-col l3 s6">
      <div class="w3-container">
        <img src="/w3images/jeans3.jpg" style="width:100%">
        <p>Washed Skinny Jeans<br><b>$20.50</b></p>
      </div>
      <div class="w3-container">
        <div class="w3-display-container">
          <img src="/w3images/jeans4.jpg" style="width:100%">
          <span class="w3-tag w3-display-topleft">Sale</span>
          <div class="w3-display-middle w3-display-hover">
            <button class="w3-button w3-black">Buy now <i class="fa fa-shopping-cart"></i></button>
          </div>
        </div>
        <p>Vintage Skinny Jeans<br><b class="w3-text-red">$14.99</b></p>
      </div>
    </div>
                
            <% } %>
    
  </div>