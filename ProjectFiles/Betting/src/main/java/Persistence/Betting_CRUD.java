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
public class Betting_CRUD {
    private static Connection getCon(){
    Connection con=null;
     try{
         
         Class.forName("com.mysql.cj.jdbc.Driver");
         String connection = System.getenv("DB_URL");
         System.out.println(connection);
        //con=DriverManager.getConnection("jdbc:mysql://db:3306/hold_LBS?allowPublicKeyRetrieval=true&useSSL=false", "root", "student");
       
        con = DriverManager.getConnection("jdbc:mysql://"+connection+"/Betting_ESPN?allowPublicKeyRetrieval=true&useSSL=false&autoReconnect=true", "root", "student");
        System.out.println("Connection established.");
     }
     catch(Exception e){ 
         System.out.println(e);
     }
     return con;
    }
    
    public static boolean createBet(String user, String BetAmount, String odds){
        try{
            Connection con = getCon();
            
            String query = "INSERT INTO Betting_ESPN.Betting(userID, odds, priceOfBet) VALUES (" + user + ", " + odds + ", "+ BetAmount +");";
            
            Statement stmt = con.createStatement();
            stmt.executeUpdate(query);
            return true;
           // INSERT INTO Accounts(username, password) VALUES ("Admin", "Admin");
       
        } catch (Exception e){
         System.out.println(e);
         return false;
        } 
        
    }
    
    
    
    
}
