<%@page import="com.entity.cart"%>
<%@page import="com.conn.DBConnect"%>
<%@page import="com.dao.DAO2"%>
<%@page import="java.sql.*,java.io.*,java.text.*,java.util.*" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Cart View - ElectroShop Admin</title>
<link rel="stylesheet" href="Css/main_modern.css">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
</head>
<body>

<%@ include file="admin_navbar.jsp" %>

<%
    String Cust = request.getParameter("custname");
    if(Cust == null) Cust = "Unknown";
%>

<div class="container" style="margin-top: 6rem;">
    <div style="display: flex; justify-content: space-between; align-items: flex-start; margin-bottom: 4rem; border-bottom: 1px solid var(--glass-border); padding-bottom: 3rem;">
        <div>
            <div style="color: var(--primary); font-weight: 800; text-transform: uppercase; letter-spacing: 0.3em; font-size: 0.7rem; margin-bottom: 1rem;">ORDER_DESK // CART_INSPECTION</div>
            <h1 style="font-size: 3.5rem; font-weight: 900; text-transform: uppercase; letter-spacing: -0.02em; line-height: 1;"><%= Cust %>'s Cart</h1>
            <p style="color: var(--text-muted); margin-top: 1.5rem; font-size: 1.125rem; max-width: 600px;">Inspecting active procurement items for operator: <strong><%= Cust %></strong>. Verified for fulfillment processing.</p>
        </div>
        <div style="text-align: right; border: 1px solid var(--glass-border); padding: 1.5rem 2rem; background: var(--bg-card);">
            <span style="font-size: 0.7rem; color: var(--text-muted); text-transform: uppercase; letter-spacing: 0.2em; display: block; margin-bottom: 0.5rem;">Cart Status</span>
            <div style="font-weight: 900; color: var(--primary); font-size: 1.25rem;">ACTIVE_INSPECTION</div>
        </div>
    </div>

    <div class="glass" style="padding: 1px; background: var(--glass-border); margin-bottom: 4rem;">
        <table class="industrial-table">
            <thead>
                <tr>
                    <th style="width: 120px;">Asset</th>
                    <th>Product Specification</th>
                    <th>Classification</th>
                    <th style="text-align: center;">Quantity</th>
                    <th style="text-align: right;">Unit Price</th>
                    <th style="text-align: right;">Subtotal</th>
                    <th style="text-align: center;">Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    int Total = 0;
                    DAO2 dao = new DAO2(DBConnect.getConn());
                    List<cart> listv = dao.getcart(Cust);
                    for(cart v : listv) {
                        int subtotal = v.getPprice() * v.getPquantity();
                        Total += subtotal;
                %>
                <tr>
                    <td>
                        <div style="width: 80px; height: 80px; background: #fff; padding: 0.5rem; border: 1px solid var(--glass-border);">
                            <img src="images/<%= v.getPimage() %>" alt="<%= v.getPname() %>" style="width: 100%; height: 100%; object-fit: contain;">
                        </div>
                    </td>
                    <td>
                        <div style="font-weight: 700; color: var(--text-main);"><%= v.getBname() %></div>
                        <div style="font-size: 0.8125rem; color: var(--text-muted);"><%= v.getPname() %></div>
                    </td>
                    <td>
                        <span class="status-badge status-pending" style="font-size: 0.6rem;"><%= v.getCname() %></span>
                    </td>
                    <td style="text-align: center; font-family: monospace; font-weight: 700;">
                        <%= v.getPquantity() %>
                    </td>
                    <td style="text-align: right; font-family: monospace;">
                        ₹ <%= v.getPprice() %>
                    </td>
                    <td style="text-align: right; font-family: monospace; font-weight: 700; color: var(--primary);">
                        ₹ <%= subtotal %>
                    </td>
                    <td style="text-align: center;">
                        <a href="removecarta?ie=<%=v.getPimage()%>&id=<%=v.getName()%>" style="opacity: 0.5; transition: 0.2s;" onmouseover="this.style.opacity='1'" onmouseout="this.style.opacity='0.5'">
                            <img src="images/delete.jpg" alt="Remove" height="18" style="filter: grayscale(1) invert(1);">
                        </a>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>

    <div style="display: flex; justify-content: flex-end; margin-bottom: 6rem;">
        <div style="background: var(--bg-card); border: 1px solid var(--glass-border); padding: 3rem; min-width: 400px;">
            <div style="display: flex; justify-content: space-between; margin-bottom: 1.5rem; color: var(--text-muted); font-size: 0.8125rem; text-transform: uppercase; letter-spacing: 0.1em;">
                <span>Total Assets</span>
                <span><%= listv.size() %> Items</span>
            </div>
            <div style="display: flex; justify-content: space-between; align-items: flex-end; padding-top: 1.5rem; border-top: 1px solid var(--glass-border);">
                <span style="font-weight: 800; text-transform: uppercase; letter-spacing: 0.1em; font-size: 0.8125rem;">Total Valuation</span>
                <span style="font-size: 2.5rem; font-weight: 900; color: var(--text-main); letter-spacing: -0.02em;">₹ <%= Total %></span>
            </div>
            <div style="margin-top: 2rem;">
                <a href="managecustomers.jsp" class="btn-primary" style="width: 100%; padding: 1.25rem; background: transparent; border-color: var(--glass-border); color: var(--text-main);">Back to Directory</a>
            </div>
        </div>
    </div>
</div>

<%@ include file="footer.jsp" %>

</body>
</html>