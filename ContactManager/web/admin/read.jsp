<%@page import="com.leapfrog.cm.entity.Contact"%>
<%@page import="com.leapfrog.cm.dao.impl.ContactDAOImpl"%>
<%@page import="com.leapfrog.cm.dao.ContactDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ContactDAO contactDAO=new ContactDAOImpl();
    Contact contact=null;
    try{
        if(request.getParameter("id")==null || request.getParameter("id").isEmpty())
        {
            response.sendRedirect("index.jsp?error");
        }
        else{
            int id=Integer.parseInt(request.getParameter("id"));
            contact=contactDAO.getById(id);
            if(contact==null){
               response.sendRedirect("index.jsp?error");
            }
            contactDAO.makeRead(id, true);
        }
    }catch(Exception e){
        
    }
%>

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
                <label>Name:</label>
                <label><%=contact.getFirstName()%><%=contact.getLastName()%></label>
            </div>
            <div class="form-group">
                <label>Email:</label>
                <label><%=contact.getEmail()%></label>
            </div>
            <div class="form-group">
                <label>Subject:</label>
                <label><%=contact.getSubject()%></label>
            </div>
            <div class="form-group">
                <label>Message:</label>
                <label><%=contact.getMessage()%></label>
            </div>            
            <a href="index.jsp" class="btn btn-danger">Back</a>
        </form>
        </div>
    </body>
</html>
