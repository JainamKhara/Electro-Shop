<%@page import="com.dao.DAO5"%>
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
<title>Cart Table - Admin Terminal</title>
<link rel="stylesheet" href="Css/main_modern.css">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
</head>
<body>
    <%@ include file="admin_navbar.jsp" %>

    <div class="container" style="margin-top: 4rem;">
        <div style="display: flex; justify-content: space-between; align-items: flex-end; margin-bottom: 3rem; border-bottom: 1px solid var(--glass-border); padding-bottom: 2rem;">
            <div>
                <h1 style="font-size: 2rem; font-weight: 900; text-transform: uppercase; letter-spacing: 0.1em;">Table: Cart</h1>
                <p style="color: var(--text-muted); margin-top: 0.5rem;">Relational data view for all active customer procurement sessions.</p>
            </div>
            <div style="text-align: right;">
                <span style="font-size: 0.75rem; color: var(--text-muted); text-transform: uppercase; letter-spacing: 0.1em;">Engine Status</span>
                <div style="font-weight: 700; color: #22c55e;">READ_WRITE_OK</div>
            </div>
        </div>

        <div class="glass" style="padding: 1px; background: var(--glass-border);">
            <table class="industrial-table">
                <thead>
                    <tr>
                        <th>Operator</th>
                        <th>Product Specs</th>
                        <th>Category</th>
                        <th>Designation</th>
                        <th>Price</th>
                        <th>Qty</th>
                        <th style="text-align: right;">Operations</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        DAO5 dao = new DAO5(DBConnect.getConn());
                        List<cart> listv = dao.getAllcart();
                        for(cart v : listv) {
                    %>
                    <tr>
                        <td style="font-weight: 700;"><%= v.getName() %></td>
                        <td>
                            <div style="display: flex; align-items: center; gap: 1rem;">
                                <div style="background: #fff; padding: 0.25rem; border: 1px solid var(--glass-border);">
                                    <img src="images/<%= v.getPimage() %>" height="30" width="30" style="object-fit: contain;">
                                </div>
                                <span style="font-size: 0.75rem; text-transform: uppercase; letter-spacing: 0.05em; color: var(--text-muted);"><%= v.getBname() %></span>
                            </div>
                        </td>
                        <td><%= v.getCname() %></td>
                        <td style="font-weight: 500;"><%= v.getPname() %></td>
                        <td>₹ <%= v.getPprice() %></td>
                        <td><%= v.getPquantity() %></td>
                        <td style="text-align: right;">
                            <a href="removetable_cart?ie=<%=v.getPimage()%>&id=<%=v.getName()%>" style="opacity: 0.4; hover: opacity: 1;">
                                <img src="images/delete.jpg" alt="Delete" height="18" style="filter: grayscale(1) invert(1);">
                            </a>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>

    <%@ include file="footer.jsp" %>
</body>
</html>