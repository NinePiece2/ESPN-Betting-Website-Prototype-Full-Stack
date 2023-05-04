/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Helper;

import Persistence.UserInfo_CRUD;

/**
 *
 * @author student
 */
public class userLogin {
   /* public boolean checkLogin(String User, String Password){
        
    }*/
    public static boolean LoginInfo(String User, String Password){
        return UserInfo_CRUD.checkLogin(User, Password);
    }
}
