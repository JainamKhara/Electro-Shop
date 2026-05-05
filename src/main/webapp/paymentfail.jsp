<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Transaction Failed - Studio Carbon</title>
<link rel="stylesheet" href="Css/main_modern.css">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
</head>
<body>
<% String fail = request.getParameter("msgf"); %>

<%@ include file="customer_navbar.jsp" %>

<div class="container" style="margin-top: 10rem; text-align: center;">
    <div style="max-width: 600px; margin: 0 auto;">
        <div style="color: #ef4444; font-weight: 800; text-transform: uppercase; letter-spacing: 0.3em; font-size: 0.7rem; margin-bottom: 2rem;">CRITICAL_ERROR // TRANSACTION_ABORTED</div>
        <h1 style="font-size: 3.5rem; font-weight: 900; text-transform: uppercase; letter-spacing: -0.02em; line-height: 1; margin-bottom: 2rem;">Payment Failed</h1>
        
        <div class="glass" style="padding: 2.5rem; border: 1px solid rgba(239, 68, 68, 0.2); background: rgba(239, 68, 68, 0.05); margin-bottom: 3rem;">
            <p style="color: #f87171; font-family: monospace; font-size: 1.125rem;"><%= fail != null ? fail : "A technical exception occurred during the procurement cycle." %></p>
        </div>

        <p style="color: var(--text-muted); margin-bottom: 4rem;">The financial handshake could not be completed. No funds have been captured. Please verify your payment parameters and attempt re-authorization.</p>
        
        <div style="display: flex; gap: 1.5rem; justify-content: center;">
            <a href="cart.jsp" class="btn-primary" style="padding: 1rem 2.5rem;">RETURN_TO_CART</a>
            <a href="customerhome.jsp" class="btn-primary" style="background: transparent; border: 1px solid var(--glass-border); color: var(--text-muted); text-decoration: none; padding: 1rem 2.5rem;">OVERVIEW</a>
        </div>
    </div>
</div>

<%@ include file="footer.jsp" %>
</body>
</html>