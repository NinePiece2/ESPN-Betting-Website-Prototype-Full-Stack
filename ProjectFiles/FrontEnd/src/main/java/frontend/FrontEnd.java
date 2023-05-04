/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package frontend;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.AbstractMap;
import java.util.Date;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.core.NewCookie;
import Business.Business;
/**
 *
 * @author student
 */

@WebServlet(name = "FrontEnd", urlPatterns = {"/FrontEnd"})
public class FrontEnd extends HttpServlet {
    Authenticate autho;

    public FrontEnd() {
        autho = new Authenticate();
    }
    private final String authenticationCookieName = "login_token";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private Map.Entry<String, String> isAuthenticated(HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();
        String token = "";
        
        System.out.println("TOKEN IS");
        try {
            for (Cookie cookie : cookies) {
                System.out.println(cookie.getName());
                if (cookie.getName().equals(authenticationCookieName)) {
                    token = cookie.getValue();
                }
            }
        } catch (Exception e) {

        }
        if (!token.isEmpty())
           try {
            if (this.autho.verify(token).getKey()) {
                  Map.Entry entry= new  AbstractMap.SimpleEntry<String, String>
                             (token,this.autho.verify(token).getValue());
            return entry;

            } else {
                 Map.Entry entry= new  AbstractMap.SimpleEntry<String, String>("","");
            return entry;
            }
        } catch (UnsupportedEncodingException ex) {
            Logger.getLogger(FrontEnd.class.getName()).log(Level.SEVERE, null, ex);
        }

       Map.Entry entry= new  AbstractMap.SimpleEntry<String, String>("","");
            return entry;

    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String token = isAuthenticated(request).getKey();
        String uname = isAuthenticated(request).getValue();
        String hiddenParam = request.getParameter("pageName");
        switch (hiddenParam) {
            case "login":
                String username = (String) request.getParameter("username");
                String password = (String) request.getParameter("password");

                boolean isAuthenticated = Business.LoginInfo(username, password);
                if (isAuthenticated) {
                    request.getSession().setAttribute("uname", username);
                    token = autho.createJWT("FrontEnd", username, 100000);

                    Cookie newCookie = new Cookie(authenticationCookieName, token);
                    response.addCookie(newCookie);
                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("mainPageLogin.jsp");
                    
                    requestDispatcher.forward(request, response);

                } else{
                    PrintWriter out = response.getWriter();
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Username or Password incorrect');");
                    out.println("location='LoginPage';");
                    out.println("</script>");
                }
                break;
            case "search":
/*
                BooksXML result;
                String query = request.getParameter("query");
                if (token.isEmpty()) {
                    result = retreiveServicesFromBackend(query, null);
                    request.setAttribute("bookResults", result);
                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("frontpageWithoutLogin.jsp");

                    requestDispatcher.forward(request, response);
                    break;
                } else {
                    request.setAttribute("username", uname);
                    result = retreiveServicesFromBackend(query, token);

                    request.setAttribute("bookResults", result);

                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("frontpageWithLogin.jsp");

                    requestDispatcher.forward(request, response);
                }*/
                break;
            case "bets":
                //System.out.println(token);
                if (token.isEmpty()) {
                    PrintWriter out = response.getWriter();
                    out.println("");
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Please create an account or login first!');");
                    out.println("location='index.html';");
                    out.println("</script>");
                    break;
                } else{
                    /*String user = (String) request.getParameter("username");
                    request.getSession().setAttribute("uname", user);
                    token = autho.createJWT("FrontEnd", user, 100000);

                    Cookie newCookie = new Cookie(authenticationCookieName, token);
                    response.addCookie(newCookie);*/
                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("BettingPage.jsp");
                    
                    requestDispatcher.forward(request, response);
                }
                break;
            case "logout":
                Cookie[] cookies = request.getCookies();
                response.setContentType("text/html");
                if (cookies != null)
                    for (Cookie cookie : cookies) {
                        //cookie.setValue("");
                        cookie.setPath("/");
                        cookie.setMaxAge(0);
                        response.addCookie(cookie);
                    }
                RequestDispatcher rd= request.getRequestDispatcher("index.html");
                rd.forward(request, response);
                break;
            case "home":
                if (token.isEmpty()) {
                    RequestDispatcher rd1= request.getRequestDispatcher("mainPage.jsp");
                    rd1.forward(request, response);  
                } else{
                    RequestDispatcher rd1= request.getRequestDispatcher("mainPageLogin.jsp");
                    rd1.forward(request, response);  
                }
                break;
        }
    }
    
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
    }

}
