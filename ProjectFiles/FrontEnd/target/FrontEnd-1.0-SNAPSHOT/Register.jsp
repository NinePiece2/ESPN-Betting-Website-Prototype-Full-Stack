<%-- 
    Document   : Register
    Created on : Mar 15, 2023, 6:17:32 PM
    Author     : student
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ESPN</title>
        <form action="LoginPage" method="post">
            <div class="loginbutton"> 
                <button type="submit">Login</button>
            </div>
        </form>
    </head>
    <body>
        <form action="RegisterAccount" method="post">  
            <div class="loginform">   
                <label>Username : </label>   
                <input type="text" placeholder="Enter Username" name="Cusername" required>  
                <label>Password : </label>   
                <input type="password" placeholder="Enter Password" name="Cpassword" required>  
                <label>Re Enter Password : </label>   
                <input type="password" placeholder="Re Enter Password" name="Cpassword2" required>  
                <button type="submit">Create Account</button>   
            </div>   
        </form>     
    </body>
</html>
