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
            id = contactDAO.delete(id);
            if(contact==null){
               response.sendRedirect("index.jsp?error");
            }
          }
    }catch(Exception e){
        
    }
%>