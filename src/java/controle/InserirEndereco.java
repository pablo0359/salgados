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
import modelo.Cidade;
import modelo.Cliente;
import modelo.Endereco;
import modelo.EnderecoDAO;

/**
 *
 * @author Mateus
 */
public class InserirEndereco extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet InserirEndereco</title>");            
            out.println("</head>");
            out.println("<body>");
           
            int id = Integer.parseInt(request.getParameter("id"));
                String logradouro = request.getParameter("logradouro");
                String uf = request.getParameter("uf");
                int cep = Integer.parseInt(request.getParameter("id"));
                String pais = request.getParameter("cep");
                int cidade = Integer.parseInt(request.getParameter("cidade"));
                int cliente = Integer.parseInt(request.getParameter("cliente"));
                
                try {
                    Endereco end = new Endereco();
                   Cidade c = new Cidade();
                   c.setId(cidade);
                   
                  Cliente cc = new Cliente();
                  cc.setId(cliente);
                  
                    end.setId(id);
                    end.setLogradouro(logradouro);
                    end.setUf(uf);
                    end.setCep(cep);
                    end.setPais(pais);
                EnderecoDAO eDAO = new EnderecoDAO();
                eDAO.inserir(end);
                response.sendRedirect("listar_produto.jsp");
            } catch (Exception e) {
                out.print("Erro:"+e);
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

}
