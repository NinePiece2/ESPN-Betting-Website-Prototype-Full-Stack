<%-- 
    Document   : LoginPage
    Created on : Feb 2, 2023, 5:44:39 PM
    Author     : student
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ESPN</title>
        <form action="Register" method="post">
            <div class="loginbutton"> 
                <button type="submit">Register</button>
            </div>
        </form>
    </head>
    <body>
        <h3>Login</h3>
        
        <form action="FrontEnd" method="post">  
            <div class="loginform">   
                <input type="hidden" name="pageName" value="login"/>
                <label>Username : </label>   
                <input type="text" placeholder="Enter Username" name="username" required>  
                <label>Password : </label>   
                <input type="password" placeholder="Enter Password" name="password" required>  
                <button type="submit">Login</button>   
                <input type="checkbox"> Remember me | 
                <a href="#">Forgot password?</a>   
            </div>   
        </form>     
        
        
    </body>
</html>
