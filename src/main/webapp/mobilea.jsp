<%@page import="com.entity.mobile"%>
<%@page import="com.dao.DAO3"%>
<%@page import="java.util.List"%>
<%@page import="com.conn.DBConnect"%>
<%@page import="java.sql.*,java.io.*,java.text.*,java.util.*" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mobile Inventory - ElectroShop Admin</title>
<link rel="stylesheet" href="Css/main_modern.css">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
</head>
<body>

<form action="" method="post">
<%@ include file="admin_navbar.jsp" %>

<div class="container" style="margin-top: 6rem;">
    <div style="display: flex; justify-content: space-between; align-items: flex-start; margin-bottom: 4rem; border-bottom: 1px solid var(--glass-border); padding-bottom: 3rem;">
        <div>
            <div style="color: var(--primary); font-weight: 800; text-transform: uppercase; letter-spacing: 0.3em; font-size: 0.7rem; margin-bottom: 1rem;">INVENTORY // MOBILE_COMMUNICATIONS</div>
            <h1 style="font-size: 3.5rem; font-weight: 900; text-transform: uppercase; letter-spacing: -0.02em; line-height: 1;">Handheld Devices</h1>
            <p style="color: var(--text-muted); margin-top: 1.5rem; font-size: 1.125rem; max-width: 600px;">Managing flagship mobile hardware, connectivity specs, and regional availability.</p>
        </div>
        <div style="text-align: right; border: 1px solid var(--glass-border); padding: 1.5rem 2rem; background: var(--bg-card);">
            <span style="font-size: 0.7rem; color: var(--text-muted); text-transform: uppercase; letter-spacing: 0.2em; display: block; margin-bottom: 0.5rem;">Database Status</span>
            <div style="font-weight: 900; color: #22c55e; font-size: 1.25rem;">SYNCHRONIZED</div>
        </div>
    </div>

    <div class="product-grid">
    <%
        DAO3 dao = new DAO3(DBConnect.getConn());
        List<mobile> listv = dao.getAllmobile();
        for(mobile v : listv)
        {%>
        <div class="product-card">
            <div class="product-image-box">
                <a href='selecteditema.jsp?Pn=<%=v.getPimage()%>'>
                    <img src='images/<%= v.getPimage() %>' alt="<%= v.getPname()%>">
                </a>
            </div>
            <div class="product-info">
                <span style="color: var(--primary); font-weight: 800; text-transform: uppercase; letter-spacing: 0.2em; font-size: 0.65rem; margin-bottom: 0.5rem; display: block;"><%= v.getBname() %></span>
                <h3 class="product-name">
                    <a href='selecteditema.jsp?Pn=<%=v.getPimage()%>'><%= v.getPname()%></a>
                </h3>
                <div style="margin-top: auto; padding-top: 1.5rem; display: flex; justify-content: space-between; align-items: center; border-top: 1px solid var(--glass-border);">
                    <span style="font-size: 0.75rem; font-weight: 800; color: var(--text-muted); font-family: monospace;">UNIT PRICE: ₹ <%= v.getPprice() %></span>
                    <a href='selecteditema.jsp?Pn=<%=v.getPimage()%>' style="font-size: 0.7rem; text-transform: uppercase; letter-spacing: 0.1em; color: var(--text-main); font-weight: 800; border: 1px solid var(--glass-border); padding: 0.5rem 1rem;">Modify</a>
                </div>
            </div>
        </div>
        <%}%>
    </div>
</div>

<%@ include file="footer.jsp" %>
</form>

</body>
</html>