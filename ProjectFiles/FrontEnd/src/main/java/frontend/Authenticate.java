/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package frontend;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jws;
import io.jsonwebtoken.JwtBuilder;
import io.jsonwebtoken.JwtException;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.io.Encoders;
import io.jsonwebtoken.security.Keys;
import java.io.UnsupportedEncodingException;
import java.security.Key;
import java.time.Instant;
import java.time.temporal.ChronoUnit;
import java.util.AbstractMap;
import java.util.Base64;
import java.util.Date;
import java.util.Map.Entry;
import static javax.crypto.Cipher.SECRET_KEY;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
import javax.xml.bind.DatatypeConverter;

/**
 *
 * @author student
 */
public class Authenticate {

    SignatureAlgorithm signatureAlgorithm=SignatureAlgorithm.HS256;;

    String secretString="asdfSFS34wfsdfsdfSDSD32dfsddDDerQSNCK34SOWEK5354fdgdf4";

    



   

    public String createJWT(String issuer, String subject, long ttlMillis) {

        //The JWT signature algorithm we will be using to sign the token
        long nowMillis = System.currentTimeMillis();
        //Date now = new Date(nowMillis);
        byte[] apiKeySecretBytes = DatatypeConverter.parseBase64Binary(secretString);
        //Key signingKey = new SecretKeySpec(apiKeySecretBytes, signatureAlgorithm.getJcaName());
        Key signingKey =new SecretKeySpec(Base64.getDecoder().decode(secretString), 
                            SignatureAlgorithm.HS256.getJcaName());
        //Let's set the JWT Claims
        
        Instant now = Instant.now();
        String jwtToken = Jwts.builder()
        
        .setSubject(subject)
        .setIssuedAt(Date.from(now))
        .setExpiration(Date.from(now.plus(5l, ChronoUnit.MINUTES)))
        .signWith(signingKey)
        .compact();
        System.out.println(jwtToken);
        //Builds the JWT and serializes it to a compact, URL-safe string
        return jwtToken;
    }

    public Entry<Boolean, String> verify(String jwt) throws UnsupportedEncodingException {
        Jws<Claims> jws = null;
        String username="";
        Key signingKey =new SecretKeySpec(Base64.getDecoder().decode(secretString), 
                            SignatureAlgorithm.HS256.getJcaName());
        System.out.println("I am veryfying! :" + jwt);
        try {
            jws = Jwts.parserBuilder() // (1)
                    .setSigningKey(signingKey) // (2)
                    .build() // (3)
                    .parseClaimsJws(jwt); // (4)

            System.out.println("we can safely trust the JWT");
            username=jws.getBody().getSubject();
            System.out.println(username);
                  
        } catch (JwtException ex) {       // (5)
            System.out.println("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&");
            System.out.println(ex.getMessage());
                
            System.out.println(" we *cannot* use the JWT as intended by its creator");
        }
        if (jws == null) {
            Entry entry= new  AbstractMap.SimpleEntry<Boolean, String>(false,"");
            return entry;
        }
        long nowMillis = System.currentTimeMillis();
        Date now = new Date(nowMillis);

        if (jws.getBody().getExpiration().before(now)) {
           Entry entry= new  AbstractMap.SimpleEntry<Boolean, String>(false,"");
            return entry;
        }

       Entry entry= new  AbstractMap.SimpleEntry<Boolean, String>(true,username);
            return entry;

    }

}
