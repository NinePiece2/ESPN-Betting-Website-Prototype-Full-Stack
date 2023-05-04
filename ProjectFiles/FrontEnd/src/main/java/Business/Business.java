/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Business;
import Persistence.UserInfo_CRUD;
import Helper.*;

import java.io.IOException;
import java.io.InputStream;
import java.io.StringReader;
import java.io.StringWriter;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Invocation;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;
import org.apache.commons.io.IOUtils;

/**
 *
 * @author student
 */
public class Business {
    
    private static String informationService = System.getenv("informationService");
    
    public static boolean LoginInfo(String User, String Password){
        return UserInfo_CRUD.checkLogin(User, Password);
    }
    
    public static TeamsXML getServicesTeams(String query) throws IOException {

        Client searchclient = ClientBuilder.newClient();
        WebTarget searchwebTarget
                = searchclient.target("http://" + informationService + "/Information/webresources/search");
        InputStream is
                = searchwebTarget.path(query).request(MediaType.APPLICATION_XML).get(InputStream.class);
        String xml = IOUtils.toString(is, "utf-8");
        TeamsXML teams = teamxmltoObjects(xml);
        
        return (teams);

    }
    
    public static Leagues getServicesLeague(String query) throws IOException {

        Client searchclient = ClientBuilder.newClient();
        WebTarget searchwebTarget
                = searchclient.target("http://" + informationService + "/Information/webresources/search");
        InputStream is
                = searchwebTarget.path(query).request(MediaType.APPLICATION_XML).get(InputStream.class);
        String xml = IOUtils.toString(is, "utf-8");
        Leagues leagues = leaguexmltoObjects(xml);
        
        return (leagues);

    }
    
    
    private static TeamsXML teamxmltoObjects(String xml) {
        JAXBContext jaxbContext;
        try {
            jaxbContext = JAXBContext.newInstance(TeamsXML.class);

            Unmarshaller jaxbUnmarshaller = jaxbContext.createUnmarshaller();

            TeamsXML team = (TeamsXML) jaxbUnmarshaller.unmarshal(new StringReader(xml));
            return team;

        } catch (JAXBException e) {
            e.printStackTrace();
        }
        return null;
    }

    private static Leagues leaguexmltoObjects(String xml) {
        if(xml.isEmpty())
            return null;
        JAXBContext jaxbContext;
        try {
            jaxbContext = JAXBContext.newInstance(Leagues.class);

            Unmarshaller jaxbUnmarshaller = jaxbContext.createUnmarshaller();

            Leagues league = (Leagues) jaxbUnmarshaller.unmarshal(new StringReader(xml));
            return league;

        } catch (JAXBException e) {
            e.printStackTrace();
        }
        return null;
    }
    
}
