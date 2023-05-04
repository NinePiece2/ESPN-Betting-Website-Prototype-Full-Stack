/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Business;

import java.util.ArrayList;
import Persistence.Teams_CRUD;

import Helper.*;
/**
 *
 * @author student
 */
public class viewTeams {
    public static ArrayList<Teams> viewNFLTeams(){
        return Teams_CRUD.showTeams(1);
    }
}
