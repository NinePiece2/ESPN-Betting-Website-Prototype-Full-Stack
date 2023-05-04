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
@XmlRootElement(name = "League")
@XmlAccessorType (XmlAccessType.FIELD)
public class Leagues {
    private String leagueName;
    private String sport;
    private int gamesInSeason, numOfTeams, numOfPlayers;
    
    public Leagues(){
        this.leagueName = "";
        this.sport = "";
        this.gamesInSeason = 0;
        this.numOfTeams = 0;
        this.numOfPlayers = 0;
    }
    
    public Leagues(String leagueName, String sport, int gamesInSeason, int numOfTeams, int numOfPlayers){
        this.leagueName = leagueName;
        this.sport = sport;
        this.gamesInSeason = gamesInSeason;
        this.numOfTeams = numOfTeams;
        this.numOfPlayers = numOfPlayers;
    }

    public String getLeagueName() {
        return leagueName;
    }

    public String getSport() {
        return sport;
    }

    public int getGamesInSeason() {
        return gamesInSeason;
    }

    public int getNumOfTeams() {
        return numOfTeams;
    }

    public int getNumOfPlayers() {
        return numOfPlayers;
    }
    
    
}
