<%@page import="com.entity.viewlist"%>
<%@page import="com.conn.DBConnect"%>
<%@page import="com.dao.DAO2"%>
<%@page import="java.sql.*,java.io.*,java.text.*,java.util.*" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Details - ElectroShop</title>
<link rel="stylesheet" href="Css/main_modern.css">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
</head>
<body style="background-color: var(--bg-main); color: var(--text-main);">

<%@ include file="customer_navbar.jsp" %>

<%
    String st = request.getParameter("Pn");
    DAO2 dao = new DAO2(DBConnect.getConn());		
    List<viewlist> list = dao.getSelecteditem(st);
    
    for(viewlist l : list) {
%>	

<div class="product-detail-container" style="max-width: 1400px; margin: 4rem auto; display: grid; grid-template-columns: 1.2fr 0.8fr; gap: 8rem; padding: 0 4rem;">
    <div class="product-gallery glass" style="background: #ffffff; padding: 6rem; border: 1px solid var(--glass-border); display: flex; align-items: center; justify-content: center; min-height: 600px;">
        <img src='images/<%=l.getPimage() %>' alt="<%= l.getPname() %>" style="max-width: 100%; height: auto; transition: transform 0.6s ease; filter: drop-shadow(0 20px 40px rgba(0,0,0,0.1));">
    </div>
    
    <div class="product-content" style="display: flex; flex-direction: column; justify-content: center;">
        <div style="display: flex; gap: 1rem; align-items: center; margin-bottom: 2rem;">
            <span style="color: var(--primary); font-weight: 800; text-transform: uppercase; letter-spacing: 0.3em; font-size: 0.7rem;"><%= l.getBname() %> // AUTHENTICATED SESSION</span>
            <div style="height: 1px; flex-grow: 1; background: var(--glass-border);"></div>
        </div>
        
        <h1 style="font-size: 4.5rem; font-weight: 900; margin-bottom: 2rem; line-height: 0.9; text-transform: uppercase; letter-spacing: -0.04em;"><%= l.getPname() %></h1>
        
        <div style="font-size: 3rem; font-weight: 700; color: var(--text-main); margin-bottom: 4rem; display: flex; align-items: baseline; gap: 0.75rem;">
            <span style="font-size: 1.5rem; color: var(--text-muted); font-weight: 500;">₹</span> <%= l.getPprice() %>
        </div>
        
        <div class="glass" style="padding: 3rem; background: var(--bg-card); margin-bottom: 4rem; border: 1px solid var(--glass-border);">
            <h3 class="section-title" style="padding: 0; margin-bottom: 2rem; font-size: 0.75rem; color: var(--primary);">SYSTEM SPECIFICATIONS</h3>
            <table class="industrial-table" style="background: transparent; border: none;">
                <tr style="background: transparent;">
                    <th style="padding: 1.25rem 0; border-bottom: 1px solid var(--glass-border); color: var(--text-muted);">COMPONENT_ORIGIN</th>
                    <td style="text-align: right; padding: 1.25rem 0; border-bottom: 1px solid var(--glass-border); font-weight: 800; color: var(--text-main);"><%= l.getBname() %></td>
                </tr>
                <tr style="background: transparent;">
                    <th style="padding: 1.25rem 0; border-bottom: 1px solid var(--glass-border); color: var(--text-muted);">ASSET_CLASS</th>
                    <td style="text-align: right; padding: 1.25rem 0; border-bottom: 1px solid var(--glass-border); font-weight: 800; color: var(--text-main);"><%= l.getCname() %></td>
                </tr>
                <tr style="background: transparent;">
                    <th style="padding: 1.25rem 0; color: var(--text-muted); border: none;">OPERATIONAL_STATUS</th>
                    <td style="text-align: right; padding: 1.25rem 0; font-weight: 800; color: #22c55e; border: none;">ACTIVE // <%= l.getPquantity() %> UNITS</td>
                </tr>
            </table>
        </div>

        <div style="margin-top: 2rem;">
            <a href='addtocart?id=<%= l.getBname() %>&ie=<%= l.getCname() %>&ig=<%= l.getPname() %>&ih=<%= l.getPprice() %>&ii=<%= l.getPquantity() %>&ij=<%= l.getPimage() %>&N=<%= customerDisplayName %>' 
               class="btn-primary" style="width: 100%; display: block; text-align: center; padding: 2rem; font-size: 0.875rem; letter-spacing: 0.4em; font-weight: 900;">
                INITIALIZE SECURE PROCUREMENT
            </a>
        </div>
    </div>
</div>

<div class="container" style="max-width: 1400px; margin: 8rem auto; padding: 0 4rem;">
    <div style="display: grid; grid-template-columns: 1fr 2fr; gap: 8rem; border-top: 1px solid var(--glass-border); padding-top: 4rem;">
        <div>
            <h3 class="section-title" style="font-size: 1.75rem; padding: 0; margin-bottom: 1.5rem; color: var(--text-main);">DESIGN PHILOSOPHY</h3>
            <p style="color: var(--text-muted); font-size: 0.875rem; line-height: 1.8; text-transform: uppercase; letter-spacing: 0.1em;">Technical overview and architecture analysis.</p>
        </div>
        <div style="color: var(--text-muted); line-height: 2.2; font-size: 1.25rem; font-weight: 300;">
            <p>The <%= l.getPname() %> represents a paradigm shift in <%= l.getCname() %> engineering. By leveraging the latest breakthroughs from <%= l.getBname() %>, this unit delivers unprecedented operational efficiency and technical precision. Every component is meticulously calibrated to ensure a high-fidelity experience.</p>
            <br>
            <p>Engineered for the discerning user, this asset combines a minimalist industrial aesthetic with uncompromising performance metrics. Join the elite echelon of <%= l.getBname() %> users who demand nothing short of technical excellence.</p>
        </div>
    </div>
</div>

<% } %>

<%@ include file="footer.jsp" %>

</body>
</html>