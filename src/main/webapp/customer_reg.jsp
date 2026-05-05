<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register - ElectroShop</title>
<link rel="stylesheet" href="Css/main_modern.css">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
</head>
<body>
		
<form method= "post" action = "addcustomer" enctype="multipart/form-data" >
    <%@ include file = "navbar.jsp" %>
    
    <% String Total5 = request.getParameter("Total"); %>
    <input type = "hidden" name = "Total" value =<%=Total5 %> >
    <% String CusName5 = request.getParameter("CusName"); %>
    <input type = "hidden" name = "CusName" value =<%=CusName5 %> >
    
    <div class="form-container glass" style="max-width: 600px;">
        <h1 style="text-align: center; margin-bottom: 2rem;">Join ElectroShop</h1>
        <p style="text-align: center; color: var(--text-muted); margin-bottom: 2rem;">Create your account to start shopping.</p>

        <div class="form-group">
            <label>Set Username</label>
            <input type="text" name="Username" class="form-input" placeholder="johndoe" required>
        </div>
        
        <div class="form-group">
            <label>Set Password</label>
            <input type="password" name="Password" class="form-input" placeholder="••••••••" required>
        </div>
        
        <div class="form-group">
            <label>Email Address</label>
            <input type="email" name="Email_Id" class="form-input" placeholder="john@example.com" required>
        </div>
        
        <div class="form-group">
            <label>Contact Number</label>
            <input type="number" name="Contact_No" class="form-input" placeholder="1234567890" required>
        </div>
        
        <button type="submit" name="b1" value="Register" class="btn-primary" style="width: 100%; margin-top: 1rem;">Create Account</button>
        
        <div style="text-align: center; margin-top: 1.5rem; color: var(--text-muted);">
            Already have an account? <a href="customerlogin.jsp" style="color: var(--primary); font-weight: 600;">Login here</a>
        </div>
    </div>

    <%@ include file = "footer.jsp" %>
</form>

</body>
</html>


</body>
</html>