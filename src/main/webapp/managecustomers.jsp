<%@page import="com.entity.customer"%>
<%@page import="java.util.List"%>
<%@page import="com.conn.DBConnect"%>
<%@page import="com.dao.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Management - ElectroShop Admin</title>
<link rel="stylesheet" href="Css/main_modern.css">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
</head>
<body>
<form action="" method="post">
    <%@ include file="admin_navbar.jsp" %>

    <div class="container" style="margin-top: 6rem;">
        <div style="display: flex; justify-content: space-between; align-items: flex-start; margin-bottom: 4rem; border-bottom: 1px solid var(--glass-border); padding-bottom: 3rem;">
            <div>
                <div style="color: var(--primary); font-weight: 800; text-transform: uppercase; letter-spacing: 0.3em; font-size: 0.7rem; margin-bottom: 1rem;">DATABASE // USER_MANAGEMENT</div>
                <h1 style="font-size: 3.5rem; font-weight: 900; text-transform: uppercase; letter-spacing: -0.02em; line-height: 1;">Customer Directory</h1>
                <p style="color: var(--text-muted); margin-top: 1.5rem; font-size: 1.125rem; max-width: 600px;">Managing operator credentials, procurement access profiles, and global customer interaction history.</p>
            </div>
            <div style="text-align: right; border: 1px solid var(--glass-border); padding: 1.5rem 2rem; background: var(--bg-card);">
                <span style="font-size: 0.7rem; color: var(--text-muted); text-transform: uppercase; letter-spacing: 0.2em; display: block; margin-bottom: 0.5rem;">Access Control</span>
                <div style="font-weight: 900; color: #22c55e; font-size: 1.25rem;">CONNECTED</div>
            </div>
        </div>

        <div class="glass" style="padding: 1px; background: var(--glass-border);">
            <table class="industrial-table">
                <thead>
                    <tr>
                        <th>Operator Name</th>
                        <th>Credentials</th>
                        <th>Email Protocol</th>
                        <th>Contact No.</th>
                        <th>Operations</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        DAO dao = new DAO(DBConnect.getConn());
                        List<customer> customers = dao.getAllCustomer();
                        for(customer c : customers) {
                    %>
                    <tr>
                        <td style="font-weight: 700;"><%= c.getName() %></td>
                        <td style="font-family: monospace; color: var(--text-muted);"><%= c.getPassword() %></td>
                        <td><%= c.getEmail_Id() %></td>
                        <td><%= c.getContact_No() %></td>
                        <td>
                            <div style="display: flex; gap: 1.5rem; align-items: center;">
                                <a href="carta.jsp?custname=<%= c.getName() %>" style="font-size: 0.7rem; font-weight: 800; text-transform: uppercase; letter-spacing: 0.1em; color: var(--primary);">View Cart</a>
                                <a href="deletecustomer?Name=<%= c.getName() %>&Email_Id=<%= c.getEmail_Id() %>" style="opacity: 0.5;">
                                    <img src="images/delete.jpg" alt="Delete" height="20" style="filter: grayscale(1) invert(1);">
                                </a>
                            </div>
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