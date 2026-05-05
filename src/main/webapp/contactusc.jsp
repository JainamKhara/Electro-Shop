<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contact Support - ElectroShop</title>
<link rel="stylesheet" href="Css/main_modern.css">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
</head>
<body>
<form method="post" action="addContactus">
    <%@ include file="customer_navbar.jsp" %>

    <div class="container" style="margin-top: 6rem; max-width: 1200px; display: grid; grid-template-columns: 1fr 1fr; gap: 4rem; align-items: start;">
        <div>
            <h1 style="font-size: 3.5rem; font-weight: 900; line-height: 1; text-transform: uppercase; letter-spacing: -0.02em; margin-bottom: 2rem;">
                Technical<br>Support.
            </h1>
            <p style="font-size: 1.125rem; color: var(--text-muted); line-height: 1.8; margin-bottom: 3rem;">
                Authenticated Operator Session: <span style="color: var(--text-main);"><%= customerDisplayName %></span><br>
                Our engineering team is ready to assist you with any inquiries regarding our flagship products, order status, or technical specifications.
            </p>

            <div style="display: grid; gap: 2rem;">
                <div style="border-left: 2px solid var(--glass-border); padding-left: 1.5rem;">
                    <span style="font-size: 0.75rem; text-transform: uppercase; letter-spacing: 0.1em; color: var(--primary); font-weight: 700;">Global HQ</span>
                    <p style="margin-top: 0.5rem; font-weight: 500;">123 Tech Avenue, Silicon Valley</p>
                </div>
                <div style="border-left: 2px solid var(--glass-border); padding-left: 1.5rem;">
                    <span style="font-size: 0.75rem; text-transform: uppercase; letter-spacing: 0.1em; color: var(--primary); font-weight: 700;">Voice Support</span>
                    <p style="margin-top: 0.5rem; font-weight: 500;">+1 234 567 890</p>
                </div>
                <div style="border-left: 2px solid var(--glass-border); padding-left: 1.5rem;">
                    <span style="font-size: 0.75rem; text-transform: uppercase; letter-spacing: 0.1em; color: var(--primary); font-weight: 700;">Digital Inquiry</span>
                    <p style="margin-top: 0.5rem; font-weight: 500;">support@electroshop.com</p>
                </div>
            </div>
        </div>

        <div class="form-container" style="margin: 0; width: 100%; max-width: none;">
            <h3 class="section-title" style="margin: 0; padding: 0; margin-bottom: 2.5rem; font-size: 0.875rem;">Submit Inquiry</h3>
            
            <div class="form-group">
                <label>Full Name</label>
                <input type="text" name="Name" class="form-input" value="<%= customerDisplayName %>" readonly>
            </div>

            <div class="form-group">
                <label>Email ID</label>
                <input type="email" name="Email_Id" class="form-input" placeholder="name@domain.com" required>
            </div>

            <div class="form-group">
                <label>Contact Number</label>
                <input type="number" name="Contact_No" class="form-input" placeholder="+00 000 000 0000" required>
            </div>

            <div class="form-group">
                <label>Inquiry Message</label>
                <textarea name="Message" class="form-input" rows="5" placeholder="Detailed technical query..." style="resize: none;" required></textarea>
            </div>

            <button type="submit" name="b1" value="Submit" class="btn-primary" style="width: 100%; padding: 1rem;">
                Dispatch Inquiry
            </button>
        </div>
    </div>

    <%@ include file="footer.jsp" %>
</form>
</body>
</html>