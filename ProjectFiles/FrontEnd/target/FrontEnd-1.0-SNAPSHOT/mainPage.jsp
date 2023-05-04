<%-- 
    Document   : Login
    Created on : Feb 10, 2023, 3:35:09 PM
    Author     : student
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="style.css">
        <title>ESPN</title>
    </head>
    <body>
        <div class="navbar">
        <input type="hidden" name="pageName" value="home"/>
        <a href="FrontEnd">Home</a>
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
        <div class="dropdown">
            <button class="dropbtn">Premier League 
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
            <form action="LoginPage" method="post">
                <div class="logoutbutton"> 
                    <button type="submit">Login</button>
                </div>
            </form>
        </div>
        <form action="FrontEnd" method="post">
            <div class="bettingbutton"> 
                <input type="hidden" name="pageName" value="bets"/>
                <button type="submit">Bets</button>
            </div>
        </form>
    </body>
</html>
