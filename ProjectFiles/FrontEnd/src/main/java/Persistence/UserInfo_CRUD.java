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

/**
 *
 * @author student
 */
public class UserInfo_CRUD {
    
    private static Connection getCon(){
    Connection con=null;
     try{
         
         Class.forName("com.mysql.cj.jdbc.Driver");
         String connection = System.getenv("DB_URL");
         System.out.println(connection);
        //con=DriverManager.getConnection("jdbc:mysql://db:3306/hold_LBS?allowPublicKeyRetrieval=true&useSSL=false", "root", "student");
        /*con = DriverManager.getConnection("jdbc:mysql://" + connection
                    + "/search_LBS?allowPublicKeyRetrieval=true&useSSL=false", "root", "student");*/
        //connection="localhost:3306";
        con = DriverManager.getConnection("jdbc:mysql://"+connection+"/Account_ESPN?allowPublicKeyRetrieval=true&useSSL=false&autoReconnect=true", "root", "student");
        System.out.println("Connection established.");
     }
     catch(Exception e){ 
         System.out.println(e);
     }
     return con;
    }
    
    public static boolean checkLogin(String User, String Password){
        try{
            Connection con = getCon();
            String query = "SELECT * FROM Account_ESPN.Accounts WHERE username LIKE \"%" + User + "%\";";
            
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            
            String p = "";
                        
            if (rs.next()){
                p = rs.getString("password").toString();
            }
            
            if (Password.equals(p)){
                con.close();
                return true;
            }
            
            con.close();
            return false;
            
        } catch (Exception e){
            System.out.println(e);
            return false;
        }
    }
    
    public static boolean checkUser(String User){
        try{
            Connection con = getCon();
            String query = "SELECT * FROM Account_ESPN.Accounts WHERE username LIKE \"%" + User + "%\";";
            
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            
            boolean temp = rs.next();
            
            con.close();
            return temp;
            
            
            //return false;
            
        } catch (Exception e){
            System.out.println(e);
            return false;
        }
    }
    
    public static void createAccount(String user, String password){
        try{
            Connection con = getCon();
            
            String query = "INSERT INTO Account_ESPN.Accounts(username, password) VALUES (\"" + user + "\", \"" + password +"\");";
            
            Statement stmt = con.createStatement();
            stmt.executeUpdate(query);
            
           // INSERT INTO Accounts(username, password) VALUES ("Admin", "Admin");
       
        } catch (Exception e){
         System.out.println(e);
        } 
        
    }
}
