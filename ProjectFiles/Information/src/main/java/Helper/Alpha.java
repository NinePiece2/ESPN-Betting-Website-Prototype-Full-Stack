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
@XmlRootElement(name = "a")
@XmlAccessorType (XmlAccessType.FIELD)
    public class Alpha {
    @XmlElement(name="i")
        public int i;
    
    public Alpha(int i){
        this.i = i;
    }
    
    public Alpha(){
        this.i = 0;
    }
    
    public int geti(){
        return i;
    }
}