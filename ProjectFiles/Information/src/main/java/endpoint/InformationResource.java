/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package endpoint;

import java.io.StringWriter;
import java.util.Collection;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.UriInfo;
import javax.ws.rs.Produces;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PUT;
import javax.ws.rs.PathParam;
import javax.ws.rs.core.MediaType;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import Business.*;
//import ryerson.ca.searchbook.helper.BooksXML;
//import ryerson.ca.searchbook.helper.Book;
import Helper.*;

import java.util.ArrayList;
/**
 * REST Web Service
 * @author student
 */
@Path("search/{query}")
public class InformationResource {
    
    @Context
    private UriInfo context;

    /**
     * Creates a new instance of InformationResource
     */
    public InformationResource() {
    }

    /**
     * Retrieves representation of an instance of ryerson.ca.searchbook.endpoint.SearchResource
     * @return an instance of java.lang.String
     */
    @GET
    @Produces(MediaType.APPLICATION_XML + ";charset=utf-8")
    public String getXml(@PathParam("query") String query) {
        int type = 0;
        Leagues league = new Leagues();
        ArrayList<Teams> team = new ArrayList<Teams>();
        TeamsXML teamXML = new TeamsXML();
        if (query.equalsIgnoreCase("NFL")){
            type = 1;
            league = viewLeagues.viewNFL();
        } else if(query.equalsIgnoreCase("NBA")){
            type = 1;
            league = viewLeagues.viewNBA();            
        } else if(query.equalsIgnoreCase("viewMLB")){
            type = 1;
            league = viewLeagues.viewMLB();            
        } else if(query.equalsIgnoreCase("NFLTeams")){
            type = 2;
            team = viewTeams.viewNFLTeams();
            teamXML.setTeams(team);
        }
        InformationBusiness search = new InformationBusiness();
        
        Alpha a = new Alpha(1);
        //BooksXML books = search.getBooksByQuery(query);
        //System.out.println(">>>>>>>>>>>>>>>>>>" + books);
        
        JAXBContext jaxbContext;

        try {
            if (type == 1){
                jaxbContext = JAXBContext.newInstance(Helper.Leagues.class);
            } else if(type == 2){
                jaxbContext = JAXBContext.newInstance(Helper.TeamsXML.class);
            } else{
                jaxbContext = JAXBContext.newInstance(Helper.Alpha.class);
            }
            
        
            Marshaller jaxbMarshaller = jaxbContext.createMarshaller();

            jaxbMarshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);

            StringWriter sw = new StringWriter();
            
            if (type == 1){
                jaxbMarshaller.marshal(league, sw);
            } else if(type == 2){
                jaxbMarshaller.marshal(teamXML, sw);
            }else {
                jaxbMarshaller.marshal(a, sw);
            }
            
            return (sw.toString());
    
        } catch (JAXBException ex) {
            Logger.getLogger(InformationResource.class.getName()).log(Level.SEVERE, null, ex);
            return("error happened");
        }
    }

    /**
     * PUT method for updating or creating an instance of SearchResource
     * @param content representation for the resource
     */
    @PUT
    @Consumes(MediaType.APPLICATION_XML)
    public void putXml(String content) {
    }
}
