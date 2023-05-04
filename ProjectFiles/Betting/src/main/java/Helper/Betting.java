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
@XmlRootElement(name = "bet")
@XmlAccessorType(XmlAccessType.FIELD)
public class Betting {
    String odds, amount, user;
    public Betting(){
        this.odds = "";
        this.amount = "";
        this.user = "";
    }
    
    public Betting (String user, String odds, String amount){
        this.odds = odds;
        this.amount = amount;
        this.user = user;
    }

    public String getOdds() {
        return odds;
    }

    public String getAmount() {
        return amount;
    }

    public String getUser() {
        return user;
    }
    
    
}
