<%-- 
    Document   : index
    Created on : Feb 23, 2016, 11:22:31 AM
    Author     : jeevan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css"/>

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>        
    </head>
    <body>
        <div class="container">
        <h1>Contact Us</h1>
        <form method="post" action="save.jsp">
            <div class="form-group">
                <label>First Name:</label>
                <input type="text" name="first_name" class="form-control" required="required" placeholder="Enter First Name"/>
            </div>
            <div class="form-group">
                <label>Last Name:</label>
                <input type="text" name="last_name" class="form-control" required="required" placeholder="Enter Last Name"/>
            </div>
            <div class="form-group">
                <label>Email:</label>
                <input type="email" name="email" class="form-control" required="required" placeholder="Enter Email"/>
            </div>
            <div class="form-group">
                <label>Subject:</label>
                <input type="text" name="subject" class="form-control" required="required" placeholder="Enter Subject"/>
            </div>
            <div class="form-group">
                <label>Message:</label>
                <textarea name="message" class="form-control" required="required" placeholder="Enter Message"></textarea>
            </div>            
            <button type="submit" class="btn btn-success">Send</button>
        </form>
        </div>
    </body>
</html>
