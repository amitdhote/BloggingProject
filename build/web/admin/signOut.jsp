<%-- 
    Document   : signOut
    Created on : 31-May-2021, 09:05:07
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    session.removeAttribute("admin");
    response.sendRedirect("../");
    %>
