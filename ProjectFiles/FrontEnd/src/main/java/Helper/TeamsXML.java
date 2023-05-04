/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Helper;

import java.util.ArrayList;
import java.util.List;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlElementWrapper;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author student
 */
@XmlRootElement(name = "teams")
@XmlAccessorType (XmlAccessType.FIELD)
public class TeamsXML {
    @XmlElement(name="team")
    private ArrayList<Teams> teams;
    public TeamsXML(){
        
    }
    public void setTeams(ArrayList<Teams> teams){
        this.teams = teams;
    }
    
    public ArrayList<Teams> getTeams(){
        return this.teams;
    }
}
