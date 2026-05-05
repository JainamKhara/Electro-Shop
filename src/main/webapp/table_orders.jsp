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
<title>Global Order Registry - Admin Terminal</title>
<link rel="stylesheet" href="Css/main_modern.css">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
</head>
<body>
<form method="post" action="payprocess.jsp">
    <%@ include file="admin_navbar.jsp" %>

    <div class="container" style="margin-top: 4rem;">
        <div style="display: flex; justify-content: space-between; align-items: flex-end; margin-bottom: 3rem; border-bottom: 1px solid var(--glass-border); padding-bottom: 2rem;">
            <div>
                <h1 style="font-size: 2rem; font-weight: 900; text-transform: uppercase; letter-spacing: 0.1em;">Table: Global Orders</h1>
                <p style="color: var(--text-muted); margin-top: 0.5rem;">Comprehensive transaction history for the entire ElectroShop platform.</p>
            </div>
            <div style="text-align: right;">
                <span style="font-size: 0.75rem; color: var(--text-muted); text-transform: uppercase; letter-spacing: 0.1em;">Security Context</span>
                <div style="font-weight: 700; color: #ef4444;">RESTRICTED_ADMIN</div>
            </div>
        </div>

        <div class="glass" style="padding: 1px; background: var(--glass-border);">
            <table class="industrial-table">
                <thead>
                    <tr>
                        <th>Order ID</th>
                        <th>Operator</th>
                        <th>Deployment City</th>
                        <th>Timestamp</th>
                        <th>Gross Amount</th>
                        <th>Status</th>
                        <th style="text-align: right;">Operations</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        DAO5 dao = new DAO5(DBConnect.getConn());
                        List<orders> listv = dao.getAllorders();
                        for(orders v : listv) {
                    %>
                    <tr>
                        <td style="font-family: monospace; font-weight: 700; color: var(--primary);">#<%= v.getOrder_Id() %></td>
                        <td style="font-weight: 700;"><%= v.getCustomer_Name() %></td>
                        <td><%= v.getCustomer_City() %></td>
                        <td style="color: var(--text-muted); font-size: 0.8rem;"><%= v.getDate() %></td>
                        <td style="font-weight: 700;">₹ <%= v.getTotal_Price() %></td>
                        <td>
                            <% if(v.getStatus().equalsIgnoreCase("Processing")) { %>
                                <a href="UpdateOrderStatus?id=<%= v.getOrder_Id() %>&status=Success" style="text-decoration: none;">
                                    <span class="status-badge status-pending" style="cursor: pointer;" title="Click to Complete Order">
                                        <%= v.getStatus() %>
                                    </span>
                                </a>
                            <% } else { %>
                                <span class="status-badge <%= v.getStatus().equalsIgnoreCase("Success") ? "status-success" : "status-pending" %>">
                                    <%= v.getStatus() %>
                                </span>
                            <% } %>
                        </td>
                        <td style="text-align: right;">
                            <a href="remove_orders?id=<%=v.getOrder_Id()%>" class="op-delete">
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