<%-- 
    Document   : NFLTeams
    Created on : Feb 15, 2023, 8:17:05 PM
    Author     : student
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>NFL Teams</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <div class="navbar">
        <a href="Login">Home</a>
        <a href="#">News</a>
        <div class="dropdown">
            <button class="dropbtn">NFL 
                <i class="fa fa-caret-down"></i>
            </button>
            <div class="dropdown-content">
                <a href="NFLHome">Home</a>
                <a href="#">Super Bowl LVII</a>
                <a href="#">Scores</a>
                <a href="#">Schedules</a>
                <a href="#">Standings</a>
                <a href="#">Stats</a>
                <a href="NFLTeams">Teams</a>
                <a href="#">Draft</a>
            </div>
        </div>
        <div class="dropdown">
            <button class="dropbtn">NBA 
                <i class="fa fa-caret-down"></i>
            </button>
            <div class="dropdown-content">
                <a href="#">Home</a>
                <a href="#">Scores</a>
                <a href="#">Schedules</a>
                <a href="#">Standings</a>
                <a href="#">Stats</a>
                <a href="#">Teams</a>
                <a href="#">All-Star Games</a>
            </div>
        </div>
        <div class="dropdown">
            <button class="dropbtn">NHL 
                <i class="fa fa-caret-down"></i>
            </button>
            <div class="dropdown-content">
                <a href="#">Home</a>
                <a href="#">Scores</a>
                <a href="#">Schedules</a>
                <a href="#">Standings</a>
                <a href="#">Stats</a>
                <a href="#">Teams</a>
            </div>
         </div>
        <div class="dropdown">
            <button class="dropbtn">MLB 
                <i class="fa fa-caret-down"></i>
            </button>
            <div class="dropdown-content">
                <a href="#">Home</a>
                <a href="#">Scores</a>
                <a href="#">Schedules</a>
                <a href="#">Standings</a>
                <a href="#">Stats</a>
                <a href="#">Teams</a>
                <a href="#">All-Star Games</a>
            </div>
         </div>
        <div class="dropdown">
            <button class="dropbtn">PGA Tour 
                <i class="fa fa-caret-down"></i>
            </button>
            <div class="dropdown-content">
                <a href="#">Home</a>
                <a href="#">Schedules</a>
                <a href="#">Standings</a>
                <a href="#">Stats</a>
            </div>
        </div>
            <form action="Logout" method="post">
                <div class="logoutbutton"> 
                    <button type="submit">Logout</button>
                </div>
            </form>
        </div>
        <h3>Current NFL Teams</h3>
        <!--<img src="resources/NFLTeams.jpg">-->
        <%@page import="Business.* "%>
        <%@page import="Helper.* "%>
        <%@page import="java.util.ArrayList "%>
        
        
        <table align="center" cellpadding="5" cellspacing="5"> <!--border="1" cellpadding="5" cellspacing="5"-->
        
        <tr>
        <th>  </th>
        <th> Team Name </th>
        <th> Position </th>
        <th> Trophies Won </th>

        </tr>
        
        <%  
            ArrayList<Teams> teams = Business.getServicesTeams("NFLTeams").getTeams();
            for (int i = 0; i < teams.size(); i++){
            
        %>
        
        <tr>
            <td><img src="resources/NFLLogos/<%=teams.get(i).getName()%>.png" style="width: 75px; height: 75px" ></td>
        <td> <%=teams.get(i).getName()%> </td>
        <td> <%=teams.get(i).getPositionInLeague()%> </td>
        <td> <%=teams.get(i).getTrophiesWon()%> </td>
        </tr>
        <% }
        %>
       
        </table>
        
    </body>
</html>
