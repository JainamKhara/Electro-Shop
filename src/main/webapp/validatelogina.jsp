<%@page import="java.sql.*,java.io.*,java.text.*,java.util.*" %> 
<%
    String adminUserSession = null;
    if(request.getCookies() != null) {
        Cookie[] allCookies = request.getCookies();
        int isAdminAuthenticated = 0;
        for(int i = 0; i < allCookies.length; i++) {
            if(allCookies[i].getName().equals("tname")) {
                isAdminAuthenticated = 1;
                adminUserSession = allCookies[i].getValue();
            }
        }
        if(isAdminAuthenticated != 1) {
            response.sendRedirect("adminlogin.jsp");
            return;
        }
    } else {
        response.sendRedirect("adminlogin.jsp");
        return;
    }
%>