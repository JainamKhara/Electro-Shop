<%@page import="com.conn.DBConnect"%>
<%@page import="com.dao.DAO2"%>
<%@page import="com.entity.cart"%>
<%@page import="java.sql.*,java.io.*,java.text.*,java.util.*" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Your Cart - ElectroShop</title>
<link rel="stylesheet" href="Css/main_modern.css">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
<script>
    function show() {
        alert("Add something to your cart first.");
    }
</script>
<style>
    .cart-container {
        max-width: 1000px;
        margin: 4rem auto;
        padding: 0 2rem;
    }
    .cart-header {
        border-bottom: 1px solid var(--glass-border);
        padding-bottom: 1rem;
        margin-bottom: 2rem;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }
    .cart-item {
        background: var(--bg-card);
        border: 1px solid var(--glass-border);
        margin-bottom: 1px;
        padding: 1.5rem;
        display: grid;
        grid-template-columns: 100px 1fr 100px 150px 50px;
        gap: 2rem;
        align-items: center;
    }
    .cart-item:hover {
        background: #222;
    }
    .cart-item img {
        width: 100%;
        height: 80px;
        object-fit: contain;
        background: white;
        padding: 0.5rem;
    }
    .checkout-summary {
        margin-top: 3rem;
        padding: 2.5rem;
        background: var(--bg-card);
        border: 1px solid var(--glass-border);
        text-align: right;
    }
</style>
</head>
<body>

<%@ include file = "navbar.jsp" %>

<div class="cart-container">
    <div class="cart-header">
        <h1 style="font-size: 1.5rem; letter-spacing: 0.1em; text-transform: uppercase;">Shopping Cart</h1>
        <%
            int Total = 0;
            String CusName = "empty";
            DAO2 dao = new DAO2(DBConnect.getConn());
            List<cart> listv = dao.getSelectedcart();
            for(cart v : listv) { Total += v.getPprice() * v.getPquantity(); }
        %>
        <span style="color: var(--text-muted);"><%= listv.size() %> Items</span>
    </div>

    <% if(listv.isEmpty()) { %>
        <div style="text-align: center; padding: 6rem 0;">
            <img src="images/emptycart.png" height="150" style="opacity: 0.2; margin-bottom: 2rem;">
            <h2 style="color: var(--text-muted); letter-spacing: 0.1em;">YOUR CART IS EMPTY</h2>
            <br>
            <a href="viewproduct.jsp" class="btn-primary">Browse Products</a>
        </div>
    <% } else { %>
        <div class="cart-list">
            <% for(cart v : listv) { %>
                <div class="cart-item">
                    <img src='images/<%=v.getPimage() %>' alt="<%= v.getPname() %>">
                    <div>
                        <p style="font-weight: 700; text-transform: uppercase; letter-spacing: 0.05em; font-size: 0.875rem;"><%=v.getBname() %> <%=v.getPname() %></p>
                        <p style="color: var(--text-muted); font-size: 0.75rem; margin-top: 0.25rem;"><%=v.getCname()%></p>
                    </div>
                    <div style="font-weight: 600; text-align: center;">× <%=v.getPquantity() %></div>
                    <div style="font-weight: 700; text-align: right;">₹ <%=v.getPprice() * v.getPquantity() %></div>
                    <div style="text-align: right;">
                        <a href='removecartnull?ie=<%=v.getPimage()%>' style="opacity: 0.5; transition: opacity 0.2s;" onmouseover="this.style.opacity=1" onmouseout="this.style.opacity=0.5">
                            <img src="images/delete.jpg" alt="Remove" height="20" style="filter: invert(1);">
                        </a>
                    </div>
                </div>
            <% } %>
        </div>

        <div class="checkout-summary">
            <p style="color: var(--text-muted); text-transform: uppercase; letter-spacing: 0.1em; font-size: 0.75rem; margin-bottom: 0.5rem;">Subtotal</p>
            <h2 style="font-size: 2rem; margin-bottom: 2.5rem;">₹ <%= Total %></h2>
            
            <a href='ShippingAddress.jsp?Total=<%= Total %>&CusName=<%= CusName%>' class="btn-primary" style="padding: 1.25rem 4rem; font-size: 1rem;">
                Proceed To Checkout
            </a>
        </div>
    <% } %>
</div>

<%@ include file = "footer.jsp" %>

</body>
</html>