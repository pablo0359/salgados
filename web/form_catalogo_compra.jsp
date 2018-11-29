<%-- 
    Document   : form_catalogo_compra
    Created on : 29/11/2018, 10:05:45
    Author     : pablo
--%>

<%@page import="modelo.Cliente"%>
<%@page import="modelo.Item"%>
<%@page import="modelo.ProdutoDAO"%>
<%@page import="modelo.ClienteDAO"%>
<%@page import="modelo.Cliente"%>
<%@page import="modelo.Venda"%>
<%@page import="modelo.Produto"%>
<%@page import="java.util.ArrayList"%>
<%
ArrayList<Produto> catalogo = new ArrayList<Produto>();
Venda venda = new Venda();

try{
   String nova = request.getParameter("nova");
   if(nova.equals("sim")){
        venda.setCarrinho(new ArrayList<Item>());
        Cliente cliente = (Cliente) session.getAttribute("cliente");
        venda.setCliente(cliente);
        session.setAttribute("venda", venda);
   }else{
        venda = (Venda) session.getAttribute("venda");
   }
    
}catch(Exception e){
    out.print("Erro:"+e);
}


%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Compra</title>
    </head>
    <body>
        <h1>Compra --- Carrinho(<%=venda.getCarrinho().size() %>)</h1>
        Cliente:<%=venda.getCliente().getNome() %><br/>
        <h2>Catálogo</h2>
        <table>
            <%
             for(Produto prod:catalogo){
             %>    
             <tr>
                 <td>
                     <form method="post" action="gerenciar_carrinho.do">
                         <input type="hidden" name="valor" value="<%=prod.getPreco()%>"/>
                         <input type="hidden" name="id_produto" value="<%=prod.getId() %>"/>
                         <input type="hidden" name="op" value="add"/>
                        <img src="imagens_prod/<%=prod.getId() %>.png"/><br/>
                        <%=prod.getNome() %><br/>
                        R$ <%=prod.getPreco() %><br/>
                        Qdt.:<input type="text" name="quantidade" value="1" size="3"/><input type="submit" value="+"/>
                     </form>
                 </td>
             </tr>
            <% 
                }
            %>
        </table>
        <br/>
        <a href="listar_cliente.jsp"><input type="submit" value="Cancelar"/></a>
             
        <a href="form_fecha_carrinho.jsp"><input type="submit" value="Ver Carrinho"/></a>
       
    </body>
</html>
