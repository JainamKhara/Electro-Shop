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
<title>Shopping Cart - ElectroShop</title>
<link rel="stylesheet" href="Css/main_modern.css">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
<script>
    function show() {
        alert("Add something to cart first.");
    }
</script>
</head>
<body>

<%@ include file = "customer_navbar.jsp" %>

<div class="container" style="margin-top: 4rem; min-height: 70vh;">
    <div style="display: flex; justify-content: space-between; align-items: flex-end; margin-bottom: 3rem; border-bottom: 1px solid var(--glass-border); padding-bottom: 2rem;">
        <div>
            <h1 style="font-size: 2rem; font-weight: 900; text-transform: uppercase; letter-spacing: 0.1em;">Shopping Bag</h1>
            <p style="color: var(--text-muted); margin-top: 0.5rem;">Review your selected hardware assets before final procurement.</p>
        </div>
        <div style="text-align: right;">
            <span style="font-size: 0.75rem; color: var(--text-muted); text-transform: uppercase; letter-spacing: 0.1em;">Session ID</span>
            <div style="font-weight: 700; color: var(--primary);">ACTIVE_ENCRYPTED</div>
        </div>
    </div>

    <%
    String msgg = null;
    Cookie[] cookies = request.getCookies();
    if(cookies != null) {
        for(int i = 0; i < cookies.length; i++) {
            if (cookies[i].getName().equals("cart")) {
                cookies[i].setMaxAge(0);
                response.addCookie(cookies[i]);
                msgg = "Product added to cart successfully.";
            }       
        }
    }
    %>

    <% if(msgg != null) { %>
        <div style="background: rgba(34, 197, 94, 0.1); border: 1px solid #22c55e; color: #4ade80; padding: 1rem; margin-bottom: 2rem; text-align: center; font-size: 0.875rem;">
            <%= msgg %>
        </div>
    <% } %>

    <div class="glass" style="padding: 1px; background: var(--glass-border); overflow: hidden;">
        <table class="industrial-table">
            <thead>
                <tr>
                    <th>Product Asset</th>
                    <th>Specifications</th>
                    <th>Quantity</th>
                    <th>Unit Price</th>
                    <th style="text-align: right;">Operations</th>
                </tr>
            </thead>
            <tbody>
                <%
                int Total = 0;
                String ct = customerDisplayName;
                DAO2 dao = new DAO2(DBConnect.getConn());
                List<cart> listv = dao.getcart(ct);
                for(cart v : listv) {
                %>
                <tr>
                    <td>
                        <div style="background: #fff; padding: 0.5rem; display: inline-block; border: 1px solid var(--glass-border);">
                            <img src='images/<%=v.getPimage() %>' height="60" style="object-fit: contain;">
                        </div>
                    </td>
                    <td>
                        <div style="font-weight: 800; text-transform: uppercase;"><%= v.getBname() %> <%= v.getPname() %></div>
                        <div style="font-size: 0.75rem; color: var(--text-muted); margin-top: 0.25rem;"><%= v.getCname() %></div>
                    </td>
                    <td style="font-family: monospace; font-weight: 700;"><%= v.getPquantity() %></td>
                    <td style="font-weight: 700;">₹ <%= v.getPprice() %></td>
                    <td style="text-align: right;">
                        <a href='removecart?ie=<%= v.getPimage() %>&id=<%= customerDisplayName %>' style="opacity: 0.5;">
                            <img src="images/delete.jpg" alt="Purge" height="18" style="filter: grayscale(1) invert(1);">
                        </a>
                    </td>
                </tr>
                <% 
                    Total = Total + v.getPprice() * v.getPquantity(); 
                } 
                %>
            </tbody>
        </table>
    </div>

    <% if(Total == 0) { %>
        <div style="text-align: center; padding: 8rem 0;">
            <img src="images/emptycart.png" height="120" style="filter: grayscale(1) invert(1); opacity: 0.2; margin-bottom: 2rem;">
            <h2 style="color: var(--text-muted); text-transform: uppercase; letter-spacing: 0.2em; font-size: 1.25rem;">Your Cart is Empty</h2>
            <a href="customerhome.jsp" class="btn-primary" style="margin-top: 2rem; background: transparent; border-color: var(--glass-border); color: var(--text-muted);">Return to Overview</a>
        </div>
    <% } else { %>
        <div style="margin-top: 4rem; display: flex; justify-content: flex-end; align-items: flex-start; gap: 4rem;">
            <div style="text-align: right;">
                <span style="font-size: 0.75rem; color: var(--text-muted); text-transform: uppercase; letter-spacing: 0.2em;">Procurement Value</span>
                <div style="font-size: 2.5rem; font-weight: 900; margin-top: 0.5rem;">₹ <%= Total %></div>
                <div style="margin-top: 2rem; display: flex; gap: 1.5rem; justify-content: flex-end;">
                    <a href="customerhome.jsp" class="btn-primary" style="background: transparent; border-color: var(--glass-border); color: var(--text-muted);">Continue Browsing</a>
                    <a href="ShippingAddress.jsp?Total=<%= Total %>" class="btn-primary" style="padding: 1.25rem 3rem;">Initialize Checkout</a>
                </div>
            </div>
        </div>
    <% } %>
</div>

<%@ include file = "footer.jsp" %>

</body>
</html>