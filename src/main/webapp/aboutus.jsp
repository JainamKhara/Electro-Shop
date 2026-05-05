<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>About Us - ElectroShop</title>
<link rel="stylesheet" href="Css/main_modern.css">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
</head>
<body>
<form action="" method="post">
    <%@ include file="navbar.jsp" %>

    <div class="container" style="margin-top: 6rem; max-width: 1000px;">
        <div style="border-left: 4px solid var(--primary); padding-left: 3rem; margin-bottom: 4rem;">
            <h1 style="font-size: 4rem; font-weight: 900; line-height: 1; text-transform: uppercase; letter-spacing: -0.02em;">
                Engineering<br>The Future.
            </h1>
            <p style="font-size: 1.5rem; color: var(--text-muted); margin-top: 1.5rem; font-weight: 500;">
                High-performance electronics for the modern professional.
            </p>
        </div>

        <div style="display: grid; grid-template-columns: 1fr; gap: 4rem;">
            <div class="glass" style="padding: 4rem; background: var(--bg-card);">
                <h3 class="section-title" style="margin-top: 0; padding: 0; margin-bottom: 2rem;">Our Vision</h3>
                <p style="color: var(--text-muted); font-size: 1.125rem; line-height: 1.8;">
                    Online Ecommerce Project represents the pinnacle of modern retail engineering. We don't just sell devices; we provide the tools that empower your creativity and productivity. Our selection is curated with a focus on durability, performance, and industrial-grade quality.
                </p>
                <br>
                <p style="color: var(--text-muted); font-size: 1.125rem; line-height: 1.8;">
                    Founded in 2026, ElectroShop has consistently pushed the boundaries of what an ecommerce platform can be. Our commitment to a "Studio Carbon" philosophy ensures that every interaction you have with us is precise, reliable, and professional.
                </p>
            </div>

            <div style="position: relative; overflow: hidden; height: 500px; border: 1px solid var(--glass-border);">
                <img src="images/aboutus2.jpg" alt="About Us" style="width: 100%; height: 100%; object-fit: cover; opacity: 0.8;">
                <div style="position: absolute; bottom: 0; left: 0; right: 0; padding: 2rem; background: linear-gradient(transparent, #111111);">
                    <span style="font-size: 0.75rem; letter-spacing: 0.3em; text-transform: uppercase; color: var(--primary); font-weight: 800;">Established 2026</span>
                </div>
            </div>
        </div>
    </div>

    <%@ include file="footer.jsp" %>
</form>
</body>
</html>