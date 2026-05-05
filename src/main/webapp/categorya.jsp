<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Categories - ElectroShop Admin</title>
<link rel="stylesheet" href="Css/main_modern.css">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
</head>
<body>

<%@ include file="admin_navbar.jsp" %>

<div class="container" style="margin-top: 6rem;">
    <div style="display: flex; justify-content: space-between; align-items: flex-start; margin-bottom: 4rem; border-bottom: 1px solid var(--glass-border); padding-bottom: 3rem;">
        <div>
            <div style="color: var(--primary); font-weight: 800; text-transform: uppercase; letter-spacing: 0.3em; font-size: 0.7rem; margin-bottom: 1rem;">DATABASE // CATEGORY_MANAGEMENT</div>
            <h1 style="font-size: 3.5rem; font-weight: 900; text-transform: uppercase; letter-spacing: -0.02em; line-height: 1;">Product Categories</h1>
            <p style="color: var(--text-muted); margin-top: 1.5rem; font-size: 1.125rem; max-width: 600px;">Managing global product classifications, inventory grouping, and asset categorization.</p>
        </div>
        <div style="text-align: right; border: 1px solid var(--glass-border); padding: 1.5rem 2rem; background: var(--bg-card);">
            <span style="font-size: 0.7rem; color: var(--text-muted); text-transform: uppercase; letter-spacing: 0.2em; display: block; margin-bottom: 0.5rem;">Access Control</span>
            <div style="font-weight: 900; color: #22c55e; font-size: 1.25rem;">CONNECTED</div>
        </div>
    </div>

    <div class="product-grid" style="grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));">
        <!-- TV Category -->
        <div class="product-card">
            <div class="product-image-box" style="background: var(--bg-card);">
                <a href="tva.jsp">
                    <img src="images/tv.png" alt="TVs" style="filter: brightness(0.8);">
                </a>
            </div>
            <div class="product-info">
                <span style="color: var(--primary); font-weight: 800; text-transform: uppercase; letter-spacing: 0.2em; font-size: 0.65rem; margin-bottom: 0.5rem; display: block;">Hardware Class // 01</span>
                <h3 class="product-name">Smart Televisions</h3>
                <div style="margin-top: auto; padding-top: 1.5rem; border-top: 1px solid var(--glass-border);">
                    <a href="tva.jsp" class="btn-primary" style="width: 100%; padding: 1rem;">Browse Inventory</a>
                </div>
            </div>
        </div>

        <!-- Laptop Category -->
        <div class="product-card">
            <div class="product-image-box" style="background: var(--bg-card);">
                <a href="laptopa.jsp">
                    <img src="images/laptop.png" alt="Laptops" style="filter: brightness(0.8);">
                </a>
            </div>
            <div class="product-info">
                <span style="color: var(--primary); font-weight: 800; text-transform: uppercase; letter-spacing: 0.2em; font-size: 0.65rem; margin-bottom: 0.5rem; display: block;">Hardware Class // 02</span>
                <h3 class="product-name">Performance Laptops</h3>
                <div style="margin-top: auto; padding-top: 1.5rem; border-top: 1px solid var(--glass-border);">
                    <a href="laptopa.jsp" class="btn-primary" style="width: 100%; padding: 1rem;">Browse Inventory</a>
                </div>
            </div>
        </div>

        <!-- Mobile Category -->
        <div class="product-card">
            <div class="product-image-box" style="background: var(--bg-card);">
                <a href="mobilea.jsp">
                    <img src="images/mobile.png" alt="Mobiles" style="filter: brightness(0.8);">
                </a>
            </div>
            <div class="product-info">
                <span style="color: var(--primary); font-weight: 800; text-transform: uppercase; letter-spacing: 0.2em; font-size: 0.65rem; margin-bottom: 0.5rem; display: block;">Hardware Class // 03</span>
                <h3 class="product-name">Handheld Devices</h3>
                <div style="margin-top: auto; padding-top: 1.5rem; border-top: 1px solid var(--glass-border);">
                    <a href="mobilea.jsp" class="btn-primary" style="width: 100%; padding: 1rem;">Browse Inventory</a>
                </div>
            </div>
        </div>

        <!-- Watch Category -->
        <div class="product-card">
            <div class="product-image-box" style="background: var(--bg-card);">
                <a href="watcha.jsp">
                    <img src="images/watch.png" alt="Watches" style="filter: brightness(0.8);">
                </a>
            </div>
            <div class="product-info">
                <span style="color: var(--primary); font-weight: 800; text-transform: uppercase; letter-spacing: 0.2em; font-size: 0.65rem; margin-bottom: 0.5rem; display: block;">Hardware Class // 04</span>
                <h3 class="product-name">Smart Wearables</h3>
                <div style="margin-top: auto; padding-top: 1.5rem; border-top: 1px solid var(--glass-border);">
                    <a href="watcha.jsp" class="btn-primary" style="width: 100%; padding: 1rem;">Browse Inventory</a>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="footer.jsp" %>

</body>
</html>