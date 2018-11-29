<%-- 
    Document   : produto_classificado
    Created on : 28/11/2018, 22:42:55
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
          int id = Integer.parseInt(request.getParameter("clas"));
          
            ArrayList<Produto> listaaa = new ArrayList<Produto>();
            ProdutoDAO pDAO = new ProdutoDAO();
            try{
               listaaa = pDAO.listarClass(id);
                
            }catch(Exception e){
                out.print("Erro:"+e);
            }
            
            for(Produto p:listaaa){
            
    if(p.getStatus() == 1){
    
    %>    
      <div class="w3-col l3 s6">  
      <div class="w3-container">
        <div class="w3-display-container">
          <img src="<%=p.getImg() %>" style="width:100%">
          <span class="w3-tag w3-display-topleft"><%=p.getSabor() %></span>
          <div class="w3-display-middle w3-display-hover">
            <button class="w3-button w3-black">Comprar </button>
          </div>
        </div>
        <p><%=p.getNome() %><br><b class="w3-text-red">R$<%=p.getPreco() %> unidade</b></p>
      </div>
      </div>
    <%  } } %>  
    
  </div>
    <script>
// Accordion 
function myAccFunc() {
    var x = document.getElementById("demoAcc");
    if (x.className.indexOf("w3-show") == -1) {
        x.className += " w3-show";
    } else {
        x.className = x.className.replace(" w3-show", "");
    }
}


</script>
            
</div >


<%@include file="rodape.jsp" %>


        
    </body>
</html>