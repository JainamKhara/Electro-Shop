<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>About Us (Admin) - ElectroShop</title>
<link rel="stylesheet" href="Css/main_modern.css">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
</head>
<body>
<form action="" method="post">
    <%@ include file="admin_navbar.jsp" %>

    <div class="container" style="margin-top: 6rem; max-width: 1000px;">
        <div style="border-left: 4px solid var(--primary); padding-left: 3rem; margin-bottom: 4rem;">
            <h1 style="font-size: 4rem; font-weight: 900; line-height: 1; text-transform: uppercase; letter-spacing: -0.02em;">
                Engineering<br>The Future.
            </h1>
            <p style="font-size: 1.5rem; color: var(--text-muted); margin-top: 1.5rem; font-weight: 500;">
                Administrative Portal Interface
            </p>
        </div>

        <div style="display: grid; grid-template-columns: 1fr; gap: 4rem;">
            <div class="glass" style="padding: 4rem; background: var(--bg-card);">
                <h3 class="section-title" style="margin-top: 0; padding: 0; margin-bottom: 2rem;">Platform Overview</h3>
                <p style="color: var(--text-muted); font-size: 1.125rem; line-height: 1.8;">
                    This administrative interface is designed for maximum efficiency in managing inventory, customers, and order fulfillment. Following the Studio Carbon principles, we prioritize data clarity and industrial reliability.
                </p>
            </div>
        </div>
    </div>

    <%@ include file="footer.jsp" %>
</form>
</body>
</html>