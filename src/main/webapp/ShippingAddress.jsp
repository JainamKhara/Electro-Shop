<%@page import="java.util.Date"%>
<%@page import="com.conn.DBConnect"%>
<%@page import="com.dao.DAO"%>
<%@page import="com.entity.customer"%>
<%@page import="java.sql.*,java.io.*,java.text.*,java.util.*" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shipping Details - ElectroShop</title>
<link rel="stylesheet" href="Css/main_modern.css">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
</head>
<body>

<%
    String RawTotal = request.getParameter("Total");
    String TotalParam = (RawTotal != null) ? RawTotal.trim() : "0";
    String CusNameParam = request.getParameter("CusName");
    
    // Detection logic for navbar selection
    boolean isAdminFlow = false;
    if(request.getCookies() != null) {
        Cookie[] rc = request.getCookies();
        for(Cookie c : rc) {
            if(c.getName().equals("tname")) isAdminFlow = true;
        }
    }
%>

<form method="post" action="ShippingAddress2">
    <% if(isAdminFlow) { %>
        <%@ include file="admin_navbar.jsp" %>
        <% request.setAttribute("bridgedAdminSession", adminUserSession); %>
    <% } else { %>
        <%@ include file="customer_navbar.jsp" %>
        <% request.setAttribute("bridgedCustomerName", customerDisplayName); %>
    <% } %>

    <input type="hidden" name="Total" value="<%= TotalParam %>">
    <input type="hidden" name="CusName" value="<%= CusNameParam %>">

    <div class="container" style="margin-top: 6rem;">
        <div style="display: flex; justify-content: space-between; align-items: flex-start; margin-bottom: 4rem; border-bottom: 1px solid var(--glass-border); padding-bottom: 3rem;">
            <div>
                <div style="color: var(--primary); font-weight: 800; text-transform: uppercase; letter-spacing: 0.3em; font-size: 0.7rem; margin-bottom: 1rem;">ORDER_DESK // LOGISTICS</div>
                <h1 style="font-size: 3.5rem; font-weight: 900; text-transform: uppercase; letter-spacing: -0.02em; line-height: 1;">Shipping Details</h1>
                <p style="color: var(--text-muted); margin-top: 1.5rem; font-size: 1.125rem; max-width: 600px;">Configure fulfillment destination and payment protocol for procurement cycle. Ensure all parameters are verified.</p>
            </div>
            <div style="text-align: right; border: 1px solid var(--glass-border); padding: 1.5rem 2rem; background: var(--bg-card);">
                <span style="font-size: 0.7rem; color: var(--text-muted); text-transform: uppercase; letter-spacing: 0.2em; display: block; margin-bottom: 0.5rem;">Valuation</span>
                <div style="font-weight: 900; color: var(--primary); font-size: 1.25rem;">₹ <%= TotalParam %></div>
            </div>
        </div>

        <div class="form-container" style="max-width: 700px; margin: 0 auto 6rem auto;">
            <div class="form-group">
                <label>Registered Operator</label>
                <% 
                    String displayUser = "UNAUTHORIZED";
                    String hiddenUser = "Guest";
                    
                    String adminSession = (String)request.getAttribute("bridgedAdminSession");
                    String customerName = (String)request.getAttribute("bridgedCustomerName");

                    if (isAdminFlow && adminSession != null) {
                        displayUser = adminSession + " (Admin Override)";
                        hiddenUser = adminSession;
                    } else if (customerName != null) {
                        displayUser = customerName;
                        hiddenUser = customerName;
                    }
                %>
                <input type="text" value="<%= displayUser %>" class="form-input" disabled style="background: rgba(255,255,255,0.05); color: var(--text-muted);">
                <input type="hidden" name="CName" value="<%= hiddenUser %>">
            </div>

            <div class="form-group">
                <label>Fulfillment Address (Street)</label>
                <input type="text" name="Address" class="form-input" placeholder="e.g. 742 Evergreen Terrace" required>
            </div>

            <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 1.5rem;">
                <div class="form-group">
                    <label>City / Sector</label>
                    <input type="text" name="City" class="form-input" placeholder="e.g. Springfield" required>
                </div>
                <div class="form-group">
                    <label>State / Region</label>
                    <input type="text" name="State" class="form-input" placeholder="e.g. IL" required>
                </div>
            </div>

            <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 1.5rem;">
                <div class="form-group">
                    <label>Country Code</label>
                    <input type="text" name="Country" class="form-input" placeholder="e.g. USA" required>
                </div>
                <div class="form-group">
                    <label>Postal Index Number</label>
                    <input type="number" name="Pincode" class="form-input" placeholder="000000" required>
                </div>
            </div>

            <div style="margin-top: 3rem; display: grid; grid-template-columns: 1fr 1fr; gap: 1rem; border-top: 1px solid var(--glass-border); padding-top: 2rem;">
                <button type="submit" name="cash" value="Cash on Delivery" class="btn-primary" style="background: transparent; border: 1px solid var(--glass-border); color: var(--text-main);">
                    Protocol: Cash on Delivery
                </button>
                <button type="submit" name="online" value="Online Payment" class="btn-primary">
                    Protocol: Secure Online
                </button>
            </div>
        </div>
    </div>

    <%@ include file="footer.jsp" %>
</form>
</body>
</html>