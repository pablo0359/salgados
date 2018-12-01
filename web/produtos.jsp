<%-- 
    Document   : produtos
    Created on : 28/11/2018, 21:05:36
    Author     : pablo
--%>

<%@page import="modelo.Item"%>
<%@page import="modelo.Cliente"%>
<%@page import="modelo.Venda"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.ProdutoDAO"%>
<%@page import="modelo.Produto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
  <div class="w3-row " id="jeans">
    <%          
            ArrayList<Produto> listae = new ArrayList<Produto>();

            ProdutoDAO pDAO = new ProdutoDAO();
            try{                
               listae = pDAO.listar();                
            }catch(Exception e){
                out.print("Erro:"+e);
            }
            
            for(Produto p:listae){
            
    if(p.getStatus() == 1){
    
    %>    
      <div class="w3-col l3 s6">  
      <div class="w3-container">
        <div class="w3-display-container">
            <a href="salgado.jsp?idpro=<%=p.getId() %>"><img src="<%=p.getImg() %>" style="width:100%"></a>
          <span class="w3-tag w3-display-topleft"><%=p.getSabor() %></span>
          <div class="w3-display-middle w3-display-hover">
            <a href="salgado.jsp?idpro=<%=p.getId() %>">
                <button class="w3-button w3-black">Comprar <img src="imagens/carrinho.png"/></button>
            </a>
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