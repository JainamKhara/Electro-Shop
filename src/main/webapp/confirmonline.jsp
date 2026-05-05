<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="Css/main_modern.css">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
</head>
<body>
<form method="post" action="confirmpayment.jsp">
    <%@ include file="customer_navbar.jsp" %>

    <%
        String CName = request.getParameter("CName");
        String CusName = request.getParameter("CusName");
        String City = request.getParameter("City");
        String TotalParam = request.getParameter("Total");
        String Total = (TotalParam != null) ? TotalParam.trim() : "0";
    %>
    
    <input type="hidden" name="CName" value="<%= CName %>">
    <input type="hidden" name="City" value="<%= City %>">
    <input type="hidden" name="Total" value="<%= Total %>">
    <input type="hidden" name="CusName" value="<%= CusName %>">

    <div class="container" style="margin-top: 6rem;">
        <div style="display: flex; justify-content: space-between; align-items: flex-start; margin-bottom: 4rem; border-bottom: 1px solid var(--glass-border); padding-bottom: 3rem;">
            <div>
                <div style="color: var(--primary); font-weight: 800; text-transform: uppercase; letter-spacing: 0.3em; font-size: 0.7rem; margin-bottom: 1rem;">SECURE_GATEWAY // PAYMENT</div>
                <h1 style="font-size: 3.5rem; font-weight: 900; text-transform: uppercase; letter-spacing: -0.02em; line-height: 1;">Payment Details</h1>
                <p style="color: var(--text-muted); margin-top: 1.5rem; font-size: 1.125rem; max-width: 600px;">Entering secure financial parameters for transaction authorization. All data is encrypted via protocol standard v4.2.</p>
            </div>
            <div style="text-align: right; border: 1px solid var(--glass-border); padding: 1.5rem 2rem; background: var(--bg-card);">
                <span style="font-size: 0.7rem; color: var(--text-muted); text-transform: uppercase; letter-spacing: 0.2em; display: block; margin-bottom: 0.5rem;">Authorization Amount</span>
                <div style="font-weight: 900; color: #22c55e; font-size: 1.25rem;">₹ <%= Total %></div>
            </div>
        </div>

        <div style="display: grid; grid-template-columns: 1fr 1.5fr; gap: 4rem; margin-bottom: 8rem; align-items: start;">
            <div style="position: sticky; top: 10rem;">
                <div class="glass" style="padding: 2.5rem; border: 1px solid var(--glass-border); background: linear-gradient(135deg, rgba(255,255,255,0.05) 0%, rgba(255,255,255,0) 100%);">
                    <img src="images/paymethod.png" alt="Secure Payment" style="width: 100%; filter: invert(1); opacity: 0.8; margin-bottom: 2rem;">
                    <div style="font-size: 0.7rem; color: var(--text-muted); text-transform: uppercase; letter-spacing: 0.2em; margin-bottom: 1.5rem;">Verified Protocols</div>
                    <div style="display: flex; flex-direction: column; gap: 1rem;">
                        <div style="display: flex; align-items: center; gap: 0.75rem; font-size: 0.8rem; color: var(--text-main);">
                            <span style="width: 6px; height: 6px; background: #22c55e; border-radius: 50%;"></span>
                            256-bit AES Encryption
                        </div>
                        <div style="display: flex; align-items: center; gap: 0.75rem; font-size: 0.8rem; color: var(--text-main);">
                            <span style="width: 6px; height: 6px; background: #22c55e; border-radius: 50%;"></span>
                            Fraud Protection Active
                        </div>
                    </div>
                </div>
            </div>

            <div class="glass" style="padding: 3.5rem; border: 1px solid var(--glass-border);">
                <h3 style="font-size: 1.25rem; font-weight: 800; margin-bottom: 3rem; text-transform: uppercase; letter-spacing: 0.1em;">Electronic Billing Authorization</h3>
                
                <div class="form-group">
                    <label>Name on Credit Card</label>
                    <input type="text" name="CardName" class="form-input" placeholder="OPERATOR NAME" required>
                </div>
                <div class="form-group">
                    <label>Credit Card Number</label>
                    <input type="text" name="CardNumber" id="card-number-input" class="form-input" placeholder="0000 0000 0000 0000" required maxlength="19">
                </div>

                <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 2rem;">
                    <div class="form-group">
                        <label>Select Network</label>
                        <select name="CreditCardType" class="form-input" required>
                            <option value="" disabled selected>SELECT PROTOCOL</option>
                            <option>Master Card</option>
                            <option>Visa Card</option>
                            <option>Discover</option>
                            <option>Maestro</option>
                            <option>American Express</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Security Code (CVV)</label>
                        <input type="number" name="cvvno" class="form-input" placeholder="000" required>
                    </div>
                </div>

                <div class="form-group">
                    <label>Expiration Parameters</label>
                    <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 1rem;">
                        <select name="Month" class="form-input" required>
                            <option value="" disabled selected>MONTH</option>
                            <% String[] months = {"January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"}; 
                               for(String m : months) { %>
                                <option><%= m %></option>
                            <% } %>
                        </select>
                        <select name="Year" class="form-input" required>
                            <option value="" disabled selected>YEAR</option>
                            <% for(int i = 2024; i <= 2040; i++) { %>
                                <option><%= i %></option>
                            <% } %>
                        </select>
                    </div>
                </div>

                <div style="margin-top: 4rem; display: flex; gap: 1.5rem;">
                    <button type="submit" name="online" value="Proceed" class="btn-primary" style="flex: 2;">AUTHORIZE_TRANSACTION</button>
                    <a href="customerhome.jsp" class="btn-primary" style="flex: 1; background: transparent; border: 1px solid var(--glass-border); color: var(--text-muted); text-decoration: none; text-align: center;">ABORT</a>
                </div>
            </div>
        </div>
    </div>

    <script>
        document.getElementById('card-number-input').addEventListener('input', function (e) {
            let target = e.target;
            let position = target.selectionEnd;
            let length = target.value.length;
            
            // Remove all non-digits
            let value = target.value.replace(/\D/g, '');
            
            // Limit to 16 digits
            value = value.substring(0, 16);
            
            // Add space every 4 digits
            let formattedValue = value.replace(/(\d{4})(?=\d)/g, '$1 ');
            
            target.value = formattedValue;
            
            // Adjust cursor position if necessary
            if (length !== formattedValue.length && position !== length) {
                target.setSelectionRange(position + (formattedValue.length - length), position + (formattedValue.length - length));
            }
        });
    </script>

    <%@ include file="footer.jsp" %>
</form>
</body>
</html>