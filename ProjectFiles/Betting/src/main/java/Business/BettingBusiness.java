/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Business;
import Helper.*;
import Persistence.*;
/**
 *
 * @author student
 */
public class BettingBusiness {
    

    public boolean setBet(String userid, String odds, String amount) {
        return (Betting_CRUD.createBet(userid, odds, amount));
    }
}
