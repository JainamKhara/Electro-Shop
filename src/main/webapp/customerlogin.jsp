<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Login - ElectroShop</title>
<link rel="stylesheet" href="Css/main_modern.css">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
</head>
<body>
<form method= "post" action = "checkcustomer">

<%@ include file = "navbar.jsp" %>
<% String Total4 = request.getParameter("Total"); %>
<input type = "hidden" name = "Total" value =<%=Total4 %> >
<% String CusName4 = request.getParameter("CusName"); %>
<input type = "hidden" name = "CusName" value =<%=CusName4 %> >
	
<%
String cregg = null;
String fail = null;
String msg = null;
Cookie[] cookies = request.getCookies();
if(cookies != null) {
    for(int i = 0; i < cookies.length; i++) 
    {
        if (cookies[i].getName().equals("cname")) 
        {
            cookies[i].setMaxAge(0);
            response.addCookie(cookies[i]);
            msg = "You have logged out successfully.";
        }
        
        if (cookies[i].getName().equals("un")) 
        {
            cookies[i].setMaxAge(0);
            response.addCookie(cookies[i]);
            fail = "Invalid Email or Password.";
        } 
        
        if (cookies[i].getName().equals("creg")) 
        {
            cookies[i].setMaxAge(0);
            response.addCookie(cookies[i]);
            cregg = "Registration Successful! Please login.";
        } 
    }
}
%>

<div class="form-container glass">
    <h1 style="text-align: center; margin-bottom: 2rem;">Customer Login</h1>
    
    <% if(msg != null) { %>
        <div style="background: rgba(34, 197, 94, 0.1); border: 1px solid #22c55e; color: #4ade80; padding: 1rem; margin-bottom: 2rem; text-align: center; font-size: 0.875rem;">
            <%= msg %>
        </div>
    <% } %>
    
    <% if(fail != null) { %>
        <div style="background: rgba(239, 68, 68, 0.1); border: 1px solid #ef4444; color: #f87171; padding: 1rem; margin-bottom: 2rem; text-align: center; font-size: 0.875rem;">
            <%= fail %>
        </div>
    <% } %>
    
    <% if(cregg != null) { %>
        <div style="background: rgba(34, 197, 94, 0.1); border: 1px solid #22c55e; color: #4ade80; padding: 1rem; margin-bottom: 2rem; text-align: center; font-size: 0.875rem;">
            <%= cregg %>
        </div>
    <% } %>


    <div class="form-group">
        <label for="x1">Email Address</label>
        <input type="email" id="x1" name="Email_Id" class="form-input" placeholder="name@example.com" required>
    </div>
    
    <div class="form-group">
        <label for="x2">Password</label>
        <input type="password" id="x2" name="Password" class="form-input" placeholder="••••••••" required>
    </div>
    
    <button type="submit" name="b1" value="Login" class="btn-primary" style="width: 100%; margin-top: 1rem;">Login</button>
    
    <div style="text-align: center; margin-top: 1.5rem; color: var(--text-muted);">
        Don't have an account? <a href="customer_reg.jsp?Total=<%=Total4 %>&CusName=<%=CusName4 %>" style="color: var(--primary); font-weight: 600;">Register here</a>
    </div>
</div>

<%@ include file = "footer.jsp" %>
            
</form>
</body>
</html>