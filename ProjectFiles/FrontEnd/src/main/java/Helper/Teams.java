/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Helper;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlElementWrapper;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author student
 */
@XmlRootElement(name = "team")
@XmlAccessorType(XmlAccessType.FIELD)
public class Teams {
    String name, trophiesWon;
    int positionInLeague;
    public Teams(){
        this.name = "";
        this.positionInLeague = 0;
        this.trophiesWon = "";
    }
    
    public Teams(String name, int positionInLeague, String trophiesWon){
        this.name = name;
        this.positionInLeague = positionInLeague;
        this.trophiesWon = trophiesWon;
    }

    public String getName() {
        return name;
    }

    public String getTrophiesWon() {
        return trophiesWon;
    }

    public int getPositionInLeague() {
        return positionInLeague;
    }
    
    
}
