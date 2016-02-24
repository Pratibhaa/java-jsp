<%@page import="com.leapfrog.cm.entity.Contact"%>
<%@page import="com.leapfrog.cm.dao.impl.ContactDAOImpl"%>
<%@page import="com.leapfrog.cm.dao.ContactDAO"%>
<%
    ContactDAO contactDAO=new ContactDAOImpl();
    if(request.getMethod().equalsIgnoreCase("post")){
        
        Contact contact=new Contact();
        contact.setFirstName(request.getParameter("first_name"));
        contact.setLastName(request.getParameter("last_name"));
        contact.setEmail(request.getParameter("email"));
        contact.setSubject(request.getParameter("subject"));
        contact.setMessage(request.getParameter("message"));
        
        try{
            int result=contactDAO.insert(contact);
            if(result>0){
                out.println("<h1>Thank you</h1>");
            }
        }catch(Exception e){
            out.println(e.getMessage());
        }
        
        
        
    }
    else{
        response.sendRedirect("index.jsp?error");
    }
%>