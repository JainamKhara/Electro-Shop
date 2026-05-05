<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Confirm Payment - Studio Carbon</title>
<link rel="stylesheet" href="Css/main_modern.css">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
</head>
<body>
<form method="post" action="payprocess">
    <%@ include file="customer_navbar.jsp" %>

    <%
        String CName = request.getParameter("CName");
        String CusName = request.getParameter("CusName");
        String City = request.getParameter("City");
        String TotalParam = request.getParameter("Total"); 
        String Total = (TotalParam != null) ? TotalParam.trim() : "0";
        String N2 = customerDisplayName;
    %>
    
    <input type="hidden" name="CName" value="<%= CName %>">
    <input type="hidden" name="City" value="<%= City %>">
    <input type="hidden" name="Total" value="<%= Total %>">
    <input type="hidden" name="CusName" value="<%= CusName %>">
    <input type="hidden" name="N2" value="<%= N2 %>">

    <div class="container" style="margin-top: 6rem;">
        <div style="display: flex; justify-content: space-between; align-items: flex-start; margin-bottom: 4rem; border-bottom: 1px solid var(--glass-border); padding-bottom: 3rem;">
            <div>
                <div style="color: var(--primary); font-weight: 800; text-transform: uppercase; letter-spacing: 0.3em; font-size: 0.7rem; margin-bottom: 1rem;">FINANCIAL // VERIFICATION</div>
                <h1 style="font-size: 3.5rem; font-weight: 900; text-transform: uppercase; letter-spacing: -0.02em; line-height: 1;">Confirm Payment</h1>
                <p style="color: var(--text-muted); margin-top: 1.5rem; font-size: 1.125rem; max-width: 600px;">Reviewing procurement parameters for final authorization. Total valuation and destination must be verified before proceeding.</p>
            </div>
            <div style="text-align: right; border: 1px solid var(--glass-border); padding: 1.5rem 2rem; background: var(--bg-card);">
                <span style="font-size: 0.7rem; color: var(--text-muted); text-transform: uppercase; letter-spacing: 0.2em; display: block; margin-bottom: 0.5rem;">Total Valuation</span>
                <div style="font-weight: 900; color: #22c55e; font-size: 1.25rem;">₹ <%= Total %></div>
            </div>
        </div>

        <div class="glass" style="max-width: 600px; margin: 0 auto 6rem auto; padding: 3rem; border: 1px solid var(--glass-border);">
            <div style="margin-bottom: 3rem;">
                <div style="font-size: 0.65rem; text-transform: uppercase; letter-spacing: 0.2em; color: var(--text-muted); margin-bottom: 0.5rem;">Fulfillment Destination</div>
                <div style="font-size: 1.25rem; font-weight: 800;"><%= CName %></div>
                <div style="color: var(--text-muted); font-family: monospace;"><%= City %></div>
            </div>

            <div style="margin-bottom: 3rem; padding-bottom: 3rem; border-bottom: 1px solid var(--glass-border);">
                <div style="font-size: 0.65rem; text-transform: uppercase; letter-spacing: 0.2em; color: var(--text-muted); margin-bottom: 0.5rem;">Authorized Operator</div>
                <div style="font-size: 1.25rem; font-weight: 800;"><%= N2 %></div>
            </div>

            <div style="display: flex; gap: 1rem; align-items: center;">
                <button type="submit" class="btn-primary" style="flex: 1; padding: 1.25rem;">AUTHORIZE_PAYMENT</button>
                <a href="customerhome.jsp" class="btn-primary" style="background: transparent; border: 1px solid var(--glass-border); color: var(--text-muted); padding: 1.25rem; text-decoration: none; text-align: center;">ABORT</a>
            </div>
        </div>
    </div>

    <%@ include file="footer.jsp" %>
</form>
</body>
</html>