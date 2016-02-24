<%-- 
    Document   : index
    Created on : Feb 23, 2016, 11:22:31 AM
    Author     : jeevan
--%>

<%@page import="com.leapfrog.cm.entity.Contact"%>
<%@page import="com.leapfrog.cm.dao.impl.ContactDAOImpl"%>
<%@page import="com.leapfrog.cm.dao.ContactDAO"%>
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
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
    </head>
    <body>
        <div class="container">
        <h1>Contact Manager</h1>
        <table class="table table-striped table-bordered table-hover">
            <tr>
                <th>Id</th>
                <th>Name</th>
                <th>Email</th>
                <th>Contact Date</th>
                <th>Action</th>
            </tr>
            <%
                ContactDAO contactDAO=new ContactDAOImpl();
                try{
                    for(Contact c:contactDAO.getAll()){
            %>
            <tr <% out.println(!c.isRead()?"style='font-weight:bold'":"");%> >
                <td><%=c.getId()%></td>
                <td><%=c.getFirstName()%> <%=c.getLastName()%></td>
                <td><%=c.getEmail()%></td>
                <td><%=c.getAddedDate()%></td>
                <td>
                    <a href="read.jsp?id=<%=c.getId()%>" class="btn btn-info btn-sm">View</a>
                
                    <a href="delete.jsp?id=<%=c.getId()%>" class="btn btn-danger btn-sm">Delete</a>
                </td>
                
            </tr>
            
            <%
                    } //for loop ends here
                }catch(Exception e){
                    
                }
            %>
        </table>
        </div>
        <script>
            $(document).on('ready',function(){
               $('.btn-danger').on('click',function(){
                   if(confirm('Are you sure ?')===false){
                       return false;
                   }
               }) ;
            });
        </script>
    </body>
    
</html>
