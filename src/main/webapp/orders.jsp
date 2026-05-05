<%@page import="com.conn.DBConnect"%>
<%@page import="com.entity.orders"%>
<%@page import="com.dao.DAO3"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Orders - ElectroShop</title>
<link rel="stylesheet" href="Css/main_modern.css">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
</head>
<body>
<form method="post" action="payprocess.jsp">
    <%@ include file="customer_navbar.jsp" %>

    <div class="container" style="margin-top: 4rem;">
        <div style="display: flex; justify-content: space-between; align-items: flex-end; margin-bottom: 3rem; border-bottom: 1px solid var(--glass-border); padding-bottom: 2rem;">
            <div>
                <h1 style="font-size: 2rem; font-weight: 900; text-transform: uppercase; letter-spacing: 0.1em;">Order Registry</h1>
                <p style="color: var(--text-muted); margin-top: 0.5rem;">Managing fulfillment and transaction history for <span style="color: var(--text-main);"><%= customerDisplayName %></span></p>
            </div>
            <div style="text-align: right;">
                <span style="font-size: 0.75rem; color: var(--text-muted); text-transform: uppercase; letter-spacing: 0.1em;">System Status</span>
                <div style="font-weight: 700; color: #22c55e;">OPERATIONAL</div>
            </div>
        </div>

        <div class="glass" style="padding: 1px; background: var(--glass-border);">
            <table class="industrial-table">
                <thead>
                    <tr>
                        <th>Order ID</th>
                        <th>City</th>
                        <th>Transaction Date</th>
                        <th>Amount</th>
                        <th>Fulfillment</th>
                        <th style="text-align: right;">Operations</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        String o = customerDisplayName;
                        DAO3 dao = new DAO3(DBConnect.getConn());
                        List<orders> listv = dao.getOrders(o);
                        for(orders v : listv) {
                    %>
                    <tr>
                        <td style="font-family: monospace; font-weight: 700; color: var(--primary);">#<%= v.getOrder_Id() %></td>
                        <td><%= v.getCustomer_City() %></td>
                        <td style="color: var(--text-muted);"><%= v.getDate() %></td>
                        <td style="font-weight: 700;">₹ <%= v.getTotal_Price() %></td>
                        <td>
                            <span class="status-badge <%= v.getStatus().equalsIgnoreCase("Success") ? "status-success" : "status-pending" %>">
                                <%= v.getStatus() %>
                            </span>
                        </td>
                        <td style="text-align: right;">
                            <div style="display: flex; gap: 1rem; justify-content: flex-end; align-items: center;">
                                <a href="orderdetails.jsp?id=<%=v.getDate()%>" style="font-size: 0.75rem; font-weight: 800; text-transform: uppercase; letter-spacing: 0.1em; color: var(--text-muted);">Details</a>
                                <a href="removeorders?id=<%=v.getOrder_Id()%>" style="opacity: 0.5;">
                                    <img src="images/delete.jpg" alt="Remove" height="18" style="filter: grayscale(1) invert(1);">
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