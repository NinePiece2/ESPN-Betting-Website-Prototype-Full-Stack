<%-- 
    Document   : NFLHome
    Created on : Mar 15, 2023, 8:54:15 PM
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
        <h3>NFL Information: </h1>
        <%@page import="Business.* "%>
        <%@page import="Helper.* "%>
        <!--Full name, number of teams, number of players, sport, games in a seaosn -->
        <% Leagues league = Business.getServicesLeague("NFL");%>
        <p>The <%=league.getLeagueName()%> is an <%=league.getSport()%> league with <%=league.getNumOfTeams()%> teams,
        <%=league.getNumOfPlayers()%> players and <%=league.getGamesInSeason()%> games in a season.
        </p>
    </body>
</html>
