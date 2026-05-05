<%@page import="com.dao.DAO2"%>
<%@page import="com.entity.viewlist"%>
<%@page import="java.util.List"%>
<%@page import="com.conn.DBConnect"%>
<%@page import="java.sql.*,java.io.*,java.text.*,java.util.*" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Products - ElectroShop</title>
<link rel="stylesheet" href="Css/main_modern.css">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
</head>
<body>

<form action="" method="post">
<%@ include file="customer_navbar.jsp" %>

<div class="container">
    <h3 class="section-title">All Available Products</h3>

    <div class="product-grid">
    <%
        DAO2 dao = new DAO2(DBConnect.getConn());
        List<viewlist> listv = dao.getAllviewlist();
        for(viewlist v : listv)
        {%>
        <div class="product-card">
            <div class="product-image-box">
                <a href='selecteditemc.jsp?Pn=<%=v.getPimage()%>'>
                    <img src='images/<%= v.getPimage() %>' alt="<%= v.getPname()%>">
                </a>
            </div>
            <div class="product-info">
                <h3 class="product-name"><%= v.getBname()%> <%= v.getPname()%></h3>
                <div class="product-price">₹ <%= v.getPprice() %></div>
                <a href='selecteditemc.jsp?Pn=<%=v.getPimage()%>' class="btn-primary" style="margin-top: auto;">Explore Specs</a>
            </div>
        </div>
        <%}%>
    </div>
</div>

<%@ include file="footer.jsp" %>
</form>

</body>
</html>