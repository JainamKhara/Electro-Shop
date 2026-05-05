<%@page import="com.entity.contactus"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.DAO5"%>
<%@page import="com.conn.DBConnect"%>
<%@page import="com.entity.orders"%>
<%@page import="com.dao.DAO3"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Inquiry Logs - Admin Terminal</title>
<link rel="stylesheet" href="Css/main_modern.css">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
</head>
<body>
<form method="post" action="">
    <%@ include file="admin_navbar.jsp" %>

    <div class="container" style="margin-top: 4rem;">
        <div style="display: flex; justify-content: space-between; align-items: flex-end; margin-bottom: 3rem; border-bottom: 1px solid var(--glass-border); padding-bottom: 2rem;">
            <div>
                <h1 style="font-size: 2rem; font-weight: 900; text-transform: uppercase; letter-spacing: 0.1em;">Table: Inquiry Logs</h1>
                <p style="color: var(--text-muted); margin-top: 0.5rem;">Relational data view for all technical support requests and operator communications.</p>
            </div>
            <div style="text-align: right;">
                <span style="font-size: 0.75rem; color: var(--text-muted); text-transform: uppercase; letter-spacing: 0.1em;">Persistence Layer</span>
                <div style="font-weight: 700; color: #22c55e;">READ_ONLY_ACCESS</div>
            </div>
        </div>

        <div class="glass" style="padding: 1px; background: var(--glass-border);">
            <table class="industrial-table">
                <thead>
                    <tr>
                        <th>Inquiry ID</th>
                        <th>Operator Name</th>
                        <th>Email Protocol</th>
                        <th>Contact No.</th>
                        <th>Message Content</th>
                        <th style="text-align: right;">Operations</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        DAO5 dao = new DAO5(DBConnect.getConn());
                        List<contactus> listv = dao.getcontactus();
                        for(contactus v : listv) {
                    %>
                    <tr>
                        <td style="font-family: monospace; font-weight: 700; color: var(--primary);">#<%= v.getId() %></td>
                        <td style="font-weight: 700;"><%= v.getName() %></td>
                        <td><%= v.getEmail_Id() %></td>
                        <td><%= v.getContact_No() %></td>
                        <td style="color: var(--text-muted); font-size: 0.875rem; max-width: 400px; line-height: 1.4;"><%= v.getMessage() %></td>
                        <td style="text-align: right;">
                            <a href="remove_contactus?id=<%=v.getId()%>" style="opacity: 0.4; hover: opacity: 1;">
                                <img src="images/delete.jpg" alt="Purge" height="18" style="filter: grayscale(1) invert(1);">
                            </a>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>

    <%@ include file="footer.jsp" %>
</form>
</body>
</html>