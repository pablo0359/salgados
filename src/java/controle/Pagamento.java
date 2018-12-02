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
    private final String EMAIL = "pablo@gmail.com";
    private final String TOKEN = "pablo@gmail.com";
    private Venda venda;
            
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
            
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Pagamento</title>");            
            out.println("</head>");
            out.println("<body>");
            try{
                int id = Integer.parseInt(request.getParameter("id"));
                VendaDAO vend = new VendaDAO();
                venda =  vend.carregarPorId(id);
            }
            catch(Exception e){
                out.print("Erro:"+e);
            }
            
            try{
                PaymentRequest request = new PaymentRequest(request,  response);
                request.setReference(venda.getId()+"");
                request.setCurrency(Currency.BRL);
                request.setSender(getSender());
                request.setShipping(getShipping());
                request.setItems(getItem());
                request.setNotificationURL("");
                request.setRedirectURL("");
                
                return request.register(getCredentials());
            }
            catch (PagSeguroServiceException ex)
            {
                Logger.getLogger(Pagamento.class.getName()).log(Level.SEVERE, null, ex);
                return ex.getMessage();
            }

            
            
            
            out.println("</body>");
            out.println("</html>");
        }
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
    @Override
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
    @Override
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
        address.set
        return address;
    }

}
