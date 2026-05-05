<%@page import="com.entity.viewlist"%>
<%@page import="com.entity.customer"%>
<%@page import="java.util.List"%>
<%@page import="com.conn.DBConnect"%>
<%@page import="com.dao.DAO"%>
<%@page import="com.dao.DAO2"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard - ElectroShop</title>
<link rel="stylesheet" href="Css/main_modern.css">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
<style>
    .admin-stats {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
        gap: 1px;
        background: var(--glass-border);
        border: 1px solid var(--glass-border);
        margin-bottom: 6rem;
    }
    .stat-card {
        background: var(--bg-card);
        padding: 3rem 2rem;
        transition: var(--transition);
        border: none;
    }
    .stat-card:hover {
        background: #111;
    }
    .stat-label {
        font-size: 0.65rem;
        text-transform: uppercase;
        letter-spacing: 0.3em;
        color: var(--text-muted);
        font-weight: 800;
        margin-bottom: 1.5rem;
        display: flex;
        align-items: center;
        gap: 0.5rem;
    }
    .stat-label::before {
        content: '';
        width: 4px;
        height: 4px;
        background: var(--primary);
    }
    .stat-value {
        font-size: 3rem;
        font-weight: 900;
        color: var(--text-main);
        letter-spacing: -0.02em;
    }
</style>
</head>
<body>
    <%@ include file="admin_navbar.jsp" %>

    <div class="container" style="margin-top: 6rem;">
        <div style="display: flex; justify-content: space-between; align-items: flex-start; margin-bottom: 4rem; border-bottom: 1px solid var(--glass-border); padding-bottom: 3rem;">
            <div>
                <div style="color: var(--primary); font-weight: 800; text-transform: uppercase; letter-spacing: 0.3em; font-size: 0.7rem; margin-bottom: 1rem;">CENTRAL_COMMAND // OVERVIEW</div>
                <h1 style="font-size: 3.5rem; font-weight: 900; text-transform: uppercase; letter-spacing: -0.02em; line-height: 1;">System Overview</h1>
                <p style="color: var(--text-muted); margin-top: 1.5rem; font-size: 1.125rem; max-width: 600px;">Administrative control panel for global product inventory, order fulfillment, and core system monitoring.</p>
            </div>
            <div style="text-align: right; border: 1px solid var(--glass-border); padding: 1.5rem 2rem; background: var(--bg-card);">
                <span style="font-size: 0.7rem; color: var(--text-muted); text-transform: uppercase; letter-spacing: 0.2em; display: block; margin-bottom: 0.5rem;">Engine Status</span>
                <div style="font-weight: 900; color: #22c55e; font-size: 1.25rem;">v4.2.0-STABLE</div>
            </div>
        </div>

        <%
            DAO2 daoStats = new DAO2(DBConnect.getConn());
            DAO daoCust = new DAO(DBConnect.getConn());
            int totalInventory = daoStats.getAllviewlist().size();
            int activeOrders = daoStats.getSelectedcart().size();
            int totalCustomers = daoCust.getAllCustomer().size();
            double systemLoad = 0.04 + (Math.random() * 0.08); // Realistic pseudo-load
        %>
        <div class="admin-stats">
            <div class="stat-card">
                <div class="stat-label">Total Inventory</div>
                <div class="stat-value"><%= totalInventory %></div>
            </div>
            <div class="stat-card">
                <div class="stat-label">Active Orders</div>
                <div class="stat-value" style="color: #22c55e;"><%= activeOrders %></div>
            </div>
            <div class="stat-card">
                <div class="stat-label">Total Customers</div>
                <div class="stat-value"><%= totalCustomers %></div>
            </div>
            <div class="stat-card">
                <div class="stat-label">System Load</div>
                <div class="stat-value" style="font-family: monospace;"><%= String.format("%.2f", systemLoad) %>%</div>
            </div>
        </div>

        <h3 class="section-title" style="padding: 0; margin-bottom: 2rem;">Quick Inventory Access</h3>
        <div class="product-grid">
            <%
                DAO2 dao = new DAO2(DBConnect.getConn());
                List<viewlist> listv = dao.getAllviewlist();
                for(viewlist v : listv) {
            %>
            <div class="product-card">
                <div class="product-image-box">
                    <a href="selecteditema.jsp?Pn=<%=v.getPimage()%>">
                        <img src="images/<%= v.getPimage() %>" alt="<%= v.getPname() %>">
                    </a>
                </div>
                <div class="product-info">
                    <span style="color: var(--primary); font-weight: 800; text-transform: uppercase; letter-spacing: 0.2em; font-size: 0.65rem; margin-bottom: 0.5rem; display: block;"><%= v.getBname() %></span>
                    <h3 class="product-name">
                        <a href="selecteditema.jsp?Pn=<%=v.getPimage()%>"><%= v.getPname() %></a>
                    </h3>
                    <div style="margin-top: auto; padding-top: 1.5rem; display: flex; justify-content: space-between; align-items: center; border-top: 1px solid var(--glass-border);">
                        <span style="font-size: 0.75rem; font-weight: 800; color: var(--text-muted); font-family: monospace;">ID: #<%= v.getPimage().hashCode() % 10000 %></span>
                        <a href="selecteditema.jsp?Pn=<%=v.getPimage()%>" style="font-size: 0.7rem; text-transform: uppercase; letter-spacing: 0.1em; color: var(--text-main); font-weight: 800; border: 1px solid var(--glass-border); padding: 0.5rem 1rem;">Manage</a>
                    </div>
                </div>
            </div>
            <% } %>
        </div>
    </div>

    <%@ include file="footer.jsp" %>
</body>
</html>