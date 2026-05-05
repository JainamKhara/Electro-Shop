<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Login - ElectroShop</title>
<link rel="stylesheet" href="Css/main_modern.css">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
</head>
<body>
	
<form method= "post" action = "checkadmin">

<%@ include file = "navbar.jsp" %>
<%
String fail = null;
String msg = null;
Cookie[] cookies = request.getCookies();
if(cookies != null) {
    for(int i = 0; i < cookies.length; i++) 
    {
        if (cookies[i].getName().equals("tname")) 
        {
            cookies[i].setMaxAge(0);
            response.addCookie(cookies[i]);
            msg = "Admin logged out successfully.";
        }    
        
        if (cookies[i].getName().equals("un")) 
        {
            cookies[i].setMaxAge(0);
            response.addCookie(cookies[i]);
            fail = "Invalid Admin Credentials.";
        } 
    }
}
%>

<div class="form-container glass">
    <h1 style="text-align: center; margin-bottom: 2rem; font-size: 1.5rem; letter-spacing: 0.1em;">ADMIN PORTAL</h1>
    
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

    <div class="form-group">
        <label for="x1">Username</label>
        <input type="text" id="x1" name="Username" class="form-input" placeholder="Admin ID" required>
    </div>
    
    <div class="form-group">
        <label for="x2">Password</label>
        <input type="password" id="x2" name="Password" class="form-input" placeholder="••••••••" required>
    </div>
    
    <button type="submit" name="b1" value="Login" class="btn-primary" style="width: 100%; margin-top: 1rem;">Access Dashboard</button>
    
    <div style="margin-top: 2rem; padding: 1.5rem; border: 1px solid var(--glass-border); text-align: center;">
        <p style="color: var(--text-muted); font-size: 0.75rem; text-transform: uppercase; letter-spacing: 0.1em; margin-bottom: 0.5rem;">Access Control</p>
        <p style="font-weight: 700; font-size: 0.875rem; color: var(--primary);">UNAUTHORIZED ACCESS PROHIBITED</p>
    </div>
</div>


<%@ include file = "footer.jsp" %>
            
</form>
</body>
</html>

		
		
		
</body>
</html>