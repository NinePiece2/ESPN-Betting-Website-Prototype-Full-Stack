/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package endpoint;

import java.io.StringWriter;

import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.UriInfo;
import javax.ws.rs.Produces;
import javax.ws.rs.Consumes;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PUT;
import javax.ws.rs.PathParam;
import javax.ws.rs.core.MediaType;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
//import ryerson.ca.searchbook.helper.BooksXML;
//import ryerson.ca.searchbook.helper.Book;
import Helper.*;
import Business.*;
import java.util.ArrayList;
/**
 * REST Web Service
 * @author student
 */
@Path("betting")
public class BettingResource {
    
    @Context
    private UriInfo context;

    /**
     * Creates a new instance of BettingResource
     */
    public BettingResource() {
    }

    @POST
    @Produces(MediaType.TEXT_HTML)
    @Path("create")
    public String  addBet(@FormParam("userID") String userID, @FormParam("odds") String odds, @FormParam("amount") String amount) 
    {
        String frontendService = System.getenv("frontendService");
        frontendService="https://espn.ninepiece2.tk";
        BettingBusiness betting = new BettingBusiness();
        boolean bet = betting.setBet(userID, odds, amount);
        if (bet){
            String s = "<script type=\"text/javascript\">\n" + "alert('Bet Added');\n" + "location='" + frontendService + "/FrontEnd/Home';\n" + "</script>";
            //return("Inserted");
            //return("");
//            return("<script type=\"text/javascript\">\n");
//            return("alert('Passwords must be the same');");
//            return("location='Register';");
//            return("</script>");
            return s;
        }
        else{
            //return("Not inserted");
            String s = "<script type=\"text/javascript\">\n" + "alert('Bet Not Added(ERROR)');\n" + "location='" + frontendService + "/FrontEnd/Home';\n" + "</script>";
            return s;
        }
          /*HoldBusiness hold = new HoldBusiness();
          boolean bs=hold.hold(isbn, userid);
          if(bs)
              return("Inserted");
          else
              return("Not inserted");*/
          //return"";
    }
}
