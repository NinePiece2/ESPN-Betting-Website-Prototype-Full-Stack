<%-- 
    Document   : BettingPage
    Created on : Mar 29, 2023, 12:46:47 PM
    Author     : student
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ESPN</title>
    </head>
    <body>
        <h3>Place Bet:</h3>
        <% String bettingService = System.getenv("BETTING_PORT_80_TCP");%>
        <%bettingService="betespn.ninepiece2.tk";%>
        <%System.out.println("BettingService: "+bettingService);%>
        <form action="https://<%=bettingService%>/Betting/webresources/betting/create" method="post"> 
            <label>odds : </label>  
            <input type="text" id="odds" name="odds">
            <label>userID: </label>  
            <input type="text" id="userID" name="userID">
            <label>amount : </label>  
            <input type="text" id="amount" name="amount">
            <button type="submit">create</button>
        </form>
    </body>
</html>
