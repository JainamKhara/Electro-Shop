<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Categories - ElectroShop</title>
<link rel="stylesheet" href="Css/main_modern.css">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
</head>
<body>

<%@ include file="navbar.jsp"%>

<div class="container">
    <h3 class="section-title">Product Categories</h3>

    <div class="product-grid" style="grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));">
        
        <div class="product-card">
            <div class="product-image-box">
                <a href="tv.jsp"><img src="images/tv.png" alt="TV"></a>
            </div>
            <div class="product-info">
                <h3 class="product-name">Televisions</h3>
                <p style="color: var(--text-muted); font-size: 0.875rem; margin-bottom: 1.5rem;">Explore our high-definition smart TV collection.</p>
                <a href="tv.jsp" class="btn-primary" style="margin-top: auto;">View Range</a>
            </div>
        </div>

        <div class="product-card">
            <div class="product-image-box">
                <a href="laptop.jsp"><img src="images/laptop.png" alt="Laptop"></a>
            </div>
            <div class="product-info">
                <h3 class="product-name">Laptops</h3>
                <p style="color: var(--text-muted); font-size: 0.875rem; margin-bottom: 1.5rem;">Professional performance for creators and business.</p>
                <a href="laptop.jsp" class="btn-primary" style="margin-top: auto;">View Range</a>
            </div>
        </div>

        <div class="product-card">
            <div class="product-image-box">
                <a href="mobile.jsp"><img src="images/mobile.png" alt="Mobile"></a>
            </div>
            <div class="product-info">
                <h3 class="product-name">Mobiles</h3>
                <p style="color: var(--text-muted); font-size: 0.875rem; margin-bottom: 1.5rem;">The latest flagship devices for ultimate connectivity.</p>
                <a href="mobile.jsp" class="btn-primary" style="margin-top: auto;">View Range</a>
            </div>
        </div>

        <div class="product-card">
            <div class="product-image-box">
                <a href="watch.jsp"><img src="images/watch.png" alt="Watch"></a>
            </div>
            <div class="product-info">
                <h3 class="product-name">Watches</h3>
                <p style="color: var(--text-muted); font-size: 0.875rem; margin-bottom: 1.5rem;">Premium timepieces with modern features.</p>
                <a href="watch.jsp" class="btn-primary" style="margin-top: auto;">View Range</a>
            </div>
        </div>

    </div>
</div>

<%@ include file="footer.jsp"%>

</body>
</html>