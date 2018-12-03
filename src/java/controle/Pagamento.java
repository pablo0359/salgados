/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controle;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import br.com.uol.pagseguro.domain.AccountCredentials;
import br.com.uol.pagseguro.domain.Address;
import br.com.uol.pagseguro.domain.Credentials;
import br.com.uol.pagseguro.domain.Item;
import br.com.uol.pagseguro.domain.PaymentRequest;
import br.com.uol.pagseguro.enums.Currency;
import br.com.uol.pagseguro.domain.Phone;
import br.com.uol.pagseguro.domain.Sender;
import br.com.uol.pagseguro.domain.Shipping;
import br.com.uol.pagseguro.domain.Transaction;
import br.com.uol.pagseguro.enums.ShippingType;
import br.com.uol.pagseguro.exception.PagSeguroServiceException;
import br.com.uol.pagseguro.service.NotificationService;
import com.sun.istack.logging.Logger;
import java.math.BigDecimal;
import java.util.logging.Level;
import modelo.Venda;
import modelo.VendaDAO;
import sun.util.logging.PlatformLogger;




/**
 *
 * @author pablo
 */

public class Pagamento extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private final String EMAIL = "ednaluciacosta@gmail.com";
    private final String TOKEN = "6A770A838DF44D01A7BCD777DFA5ECA7";
    private Venda venda;
    
    
            
    protected String processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
            
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            try{
                int id = Integer.parseInt(request.getParameter("id"));
                VendaDAO vend = new VendaDAO();
                venda =  vend.carregarPorId(id);
                response.sendRedirect(criarPagamento(venda));
                
            }
            catch(Exception e){
                out.print("Erro:"+e);
            }
            
            

            
            
            
            
        }
        catch (Exception e)
            {
                return e.getMessage();
            }
        return null;
    }


    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request     
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request 
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    
    String criarPagamento(Venda venda){
        try{
                
                PaymentRequest request1 = new PaymentRequest();
                request1.setReference(venda.getId()+"");
                request1.setCurrency(Currency.BRL);
                request1.setSender(getSender());
                request1.setShipping(getShipping());
                for(modelo.Item item:venda.getCarrinho()){
                    br.com.uol.pagseguro.domain.Item itempag;
                    itempag = new br.com.uol.pagseguro.domain.Item();
                    itempag.setId(item.getId()+"");
                    itempag.setDescription(item.getProduto().getNome());
                    itempag.setQuantity(item.getQuantidade());
                    itempag.setAmount(new BigDecimal(item.getPreco()));
                request1.addItem(itempag);}
                request1.setNotificationURL("");
                request1.setRedirectURL("");
                
                return request1.register(getCredentials());
            }
            catch (PagSeguroServiceException ex)
            {
                return ex.getMessage();
            }
    }
    
    private Sender getSender() {

        Sender sender = new Sender();
        sender.setName(venda.getCliente().getNome());
        sender.setEmail(venda.getCliente().getEmail());
        sender.setPhone(new Phone("61", venda.getCliente().getTelefone()));
        return sender;
    }

    private Shipping getShipping() {
        Shipping shipping = new Shipping();
        shipping.setAddress(getAddress());
        shipping.setCost(new BigDecimal(venda.getEndereco().getCidade().getTaxa()));
        shipping.setType(ShippingType.NOT_SPECIFIED);
        return shipping;
    }

    private Address getAddress() {
        Address address = new Address();
        address.setCity(venda.getEndereco().getCidade().getCidade());
        address.setComplement("");
        address.setCountry(venda.getEndereco().getPais());
        address.setState(venda.getEndereco().getUf());
        address.setPostalCode(venda.getEndereco().getCep());
        address.setNumber(venda.getEndereco().getNumero()+"");
        address.setDistrict("");
        return address;
    }

    private Credentials getCredentials() throws PagSeguroServiceException{
         return new AccountCredentials(EMAIL, TOKEN);   
    }

}
