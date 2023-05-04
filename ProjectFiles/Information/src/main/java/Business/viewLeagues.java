/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Business;

import Persistence.Leagues_CRUD;
import Helper.*;
/**
 *
 * @author student
 */
public class viewLeagues {
    public static Leagues viewNFL(){
        return Leagues_CRUD.LeagueInformation(1);
    }
    
    public static Leagues viewNBA(){
        return Leagues_CRUD.LeagueInformation(3);
    }
    
    public static Leagues viewMLB(){
        return Leagues_CRUD.LeagueInformation(2);
    }
}
