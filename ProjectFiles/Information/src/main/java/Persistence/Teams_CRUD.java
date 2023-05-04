/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Persistence;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import java.util.ArrayList;
import Helper.*;

/**
 *
 * @author student
 */

public class Teams_CRUD {
    private static Connection getCon(){
        Connection con = null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            String connection = System.getenv("DB_URL");
            System.out.println(connection);
            con = DriverManager.getConnection("jdbc:mysql://"+connection+"/Information_ESPN?allowPublicKeyRetrieval=true&useSSL=false&autoReconnect=true", "root", "student");
            System.out.println("Connection Established");
        } catch (Exception e){
            System.out.println(e);
        }
        return con;
    }
    
    public static ArrayList<Teams> showTeams(int LeagueID){
        ArrayList<Teams> output = new ArrayList<Teams>();
        String name, trophiesWon;
        int position;
        try{
            Connection con = getCon();
            String query = "SELECT * FROM Information_ESPN.Teams WHERE leagueID LIKE " + LeagueID + ";";
            
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                Teams temp = new Teams();
                name = rs.getString("teamName").toString();
                position = rs.getInt("positionInLeague");
                
                /*if(rs.getString("trophiesWon").toString() == null){
                    temp[2] = "N/A";
                } else{
                    temp[2] = rs.getString("trophiesWon").toString();
                }*/
                
                try {
                    trophiesWon = rs.getString("trophiesWon").toString();
                } catch(NullPointerException ex){
                    trophiesWon = "N/A";
                }
                
                //temp[2] = rs.getString("trophiesWon").toString();
                //System.out.println(temp[0]);
                temp = new Teams(name, position, trophiesWon);
                output.add(temp);
            }
            
            con.close();
            
        } catch (Exception e){
            System.out.println(e);
        }
        
        return output;
        
    }
}
