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

/**
 *
 * @author student
 */
@WebServlet(name = "Login", urlPatterns = {"/Login"})
public class Login extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = (String) request.getParameter("username");
        String password = (String) request.getParameter("password");

        request.getSession().setAttribute("uname", username);

        //RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
        //rd.forward(request, response);

        //LoginData log = add();
        //System.out.println(log.validLogin(username, password));
        //if (log.validLogin(username, password) == 'n'){
            //RequestDispatcher rd= request.getRequestDispatcher("loginfailed.jsp");
            //rd.forward(request, response);
            //Alert alert = new Alert(AlertType.ERROR);
            //alert.show();
            //out.println("<p>ERROR</p>");
       // }
       // else if(log.validLogin(username, password) == 'U'){
            //request.setAttribute("booksBorrowedInfo", uinfo.getBookBorrowed());
        if (userLogin.LoginInfo(username, password)){
            RequestDispatcher rd = request.getRequestDispatcher("mainPageLogin.jsp");
            rd.forward(request, response);
        } else {
            //RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
            //rd.forward(request, response);
            PrintWriter out = response.getWriter();
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Username or Password incorrect');");
            out.println("location='LoginPage';");
            out.println("</script>");
            out.flush();
        }
       // }
    }

   /* private LoginData add() {
        LoginData temp = new LoginData();
        temp.addUser("Test", "Test", 'U');
        return temp;
    }*/

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        doPost(request, response);

    }

}
