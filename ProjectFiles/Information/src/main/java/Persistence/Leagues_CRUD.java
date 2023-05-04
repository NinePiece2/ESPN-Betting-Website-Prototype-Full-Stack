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

import Helper.*;

/**
 *
 * @author student
 */
public class Leagues_CRUD {
    
    private static Connection getCon(){
        Connection con = null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            String connection = System.getenv("DB_URL");
            System.out.println("Connection: "+ connection);
            con = DriverManager.getConnection("jdbc:mysql://"+connection+"/Information_ESPN?allowPublicKeyRetrieval=true&useSSL=false&autoReconnect=true", "root", "student");
            System.out.println("Connection Established");
        } catch (Exception e){
            System.out.println(e);
        }
        return con;
    }
    
    public static String[] Leagues(){
        String temp[] = new String[100];
        int i = 0;
        try{
            Connection con = getCon();
            String query = "SELECT * FROM Information_ESPN.Leagues LIMIT 100;";
            
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                temp[i] = rs.getString("leagueName").toString();
                i++;
            }
            
            con.close();
            
        } catch (Exception e){
            System.out.println(e);
        }
        
        return temp;
    }
    
    public static Leagues LeagueInformation(int leagueID){
        Leagues output = new Leagues();
        String name = "", sport = "";
        int teams=0, players=0, games=0;
        try{
            Connection con = getCon();
            String query = "SELECT * FROM Information_ESPN.Leagues WHERE leagueID LIKE \"%" + leagueID + "%\";";
            
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()){
                name = rs.getString("leagueName").toString();
                teams = rs.getInt("numOfTeams");
                players = rs.getInt("numOfPlayers");
                sport = rs.getString("sport").toString();
                games = rs.getInt("gamesInSeason");
            }
            
            output = new Leagues(name, sport, games, teams, players);
            
            con.close();
            
        } catch (Exception e){
            System.out.println(e);
        }
        
        return output;
    }
    
    
}