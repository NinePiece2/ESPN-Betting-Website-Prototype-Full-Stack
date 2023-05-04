/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Helper;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Persistence.UserInfo_CRUD;

/**
 *
 * @author student
 */
@WebServlet(name = "RegisterAccount", urlPatterns = {"/RegisterAccount"})
public class RegisterAccount extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
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
        String Cusername = (String) request.getParameter("Cusername");
        String Cpassword = (String) request.getParameter("Cpassword");
        String Cpassword2 = (String) request.getParameter("Cpassword2");
        
        System.out.println(Cusername + ", " + Cpassword +", " + Cpassword2 + ", " + !Cpassword.equals(Cpassword2) + ", " + UserInfo_CRUD.checkUser(Cusername));
        
        if (!Cpassword.equals(Cpassword2)){    
            PrintWriter out = response.getWriter();
            System.out.println("1");
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Passwords must be the same');");
            out.println("location='Register';");
            out.println("</script>");
            out.flush();
        } else if (UserInfo_CRUD.checkUser(Cusername)){
            PrintWriter out = response.getWriter();
            System.out.println("2");
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Username already exists');");
            out.println("location='Register';");
            out.println("</script>");
            out.flush();
        } else{
            UserInfo_CRUD.createAccount(Cusername, Cpassword);
        
            RequestDispatcher rd= request.getRequestDispatcher("LoginPage.jsp");
            rd.forward(request, response);
        }
        
        
    }

}
