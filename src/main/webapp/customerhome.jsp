<%@page import="com.entity.viewlist"%>
<%@page import="java.util.List"%>
<%@page import="com.conn.DBConnect"%>
<%@page import="com.dao.DAO2"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Home - ElectroShop</title>
<link rel="stylesheet" href="Css/main_modern.css">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
<style>
.hero-slider {
    position: relative;
    height: 550px;
    width: 100%;
    overflow: hidden;
    border-radius: 0;
    margin-bottom: 0;
}
.mySlides { display: none; height: 100%; }
.mySlides img { width: 100%; height: 100%; object-fit: cover; }
.hero-overlay {
    position: absolute;
    bottom: 0; left: 0; right: 0;
    padding: 6rem 3rem;
    background: linear-gradient(transparent, #111111);
    color: white;
}
.dot-container {
    position: absolute;
    bottom: 30px;
    width: 100%;
    text-align: center;
}
.dot {
    height: 2px; width: 30px;
    margin: 0 5px;
    background-color: rgba(255,255,255,0.2);
    border-radius: 0;
    display: inline-block;
    cursor: pointer;
    transition: var(--transition);
}
.active { background-color: var(--primary); }

.section-title {
    font-size: 1rem;
    font-weight: 900;
    margin-top: 4rem;
    margin-bottom: 2rem;
    padding: 0 3rem;
    text-transform: uppercase;
    letter-spacing: 0.2em;
    color: var(--text-muted);
}
</style>
</head>
<body>

<%@ include file="customer_navbar.jsp" %>

<div class="hero-slider">
    <div class="mySlides fade">
        <img src="images/hometv.jpg">
        <div class="hero-overlay">
            <h1 style="font-size: 4rem; font-weight: 900; line-height: 1.1;">CINEMATIC<br>EXPERIENCE</h1>
            <p style="font-size: 1.25rem; margin-top: 1.5rem; opacity: 0.8; max-width: 600px;">Explore our collection of high-definition televisions with industry-leading display technology.</p>
        </div>
    </div>

    <div class="mySlides fade">
        <img src="images/homelaptop.jpg">
        <div class="hero-overlay">
            <h1 style="font-size: 4rem; font-weight: 900; line-height: 1.1;">PRO<br>PERFORMANCE</h1>
            <p style="font-size: 1.25rem; margin-top: 1.5rem; opacity: 0.8; max-width: 600px;">Unleash your creativity with the latest high-performance laptops designed for professionals.</p>
        </div>
    </div>

    <div class="mySlides fade">
        <img src="images/homemobile.jpg">
        <div class="hero-overlay">
            <h1 style="font-size: 4rem; font-weight: 900; line-height: 1.1;">SMARTER<br>CONNECTION</h1>
            <p style="font-size: 1.25rem; margin-top: 1.5rem; opacity: 0.8; max-width: 600px;">Stay connected with the world through our curated range of flagship mobile devices.</p>
        </div>
    </div>

    <div class="dot-container">
        <span class="dot" onclick="currentSlide(1)"></span> 
        <span class="dot" onclick="currentSlide(2)"></span> 
        <span class="dot" onclick="currentSlide(3)"></span> 
    </div>
</div>

<div class="container">
    <h2 class="section-title">Featured Products</h2>
    <div class="product-grid">
        <%
            DAO2 dao = new DAO2(DBConnect.getConn());
            List<viewlist> listv = dao.getAllviewlist();
            for(viewlist v : listv) {
        %>
        <div class="product-card">
            <div class="product-image-box">
                <img src='images/<%= v.getPimage() %>' alt="<%= v.getPname() %>">
            </div>
            <div class="product-info">
                <h3 class="product-name"><%= v.getBname() %> <%= v.getPname() %></h3>
                <div class="product-price">₹ <%= v.getPprice() %></div>
                <a href='selecteditemc.jsp?Pn=<%=v.getPimage()%>' class="btn-primary" style="margin-top: auto;">View Specifications</a>
            </div>
        </div>
        <% } %>
    </div>
</div>

<%@ include file="footer.jsp" %>

<script>
let slideIndex = 0;
showSlides();

function showSlides() {
    let i;
    let slides = document.getElementsByClassName("mySlides");
    let dots = document.getElementsByClassName("dot");
    for (i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";  
    }
    slideIndex++;
    if (slideIndex > slides.length) {slideIndex = 1}    
    for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" active", "");
    }
    slides[slideIndex-1].style.display = "block";  
    dots[slideIndex-1].className += " active";
    setTimeout(showSlides, 5000);
}

function currentSlide(n) {
    slideIndex = n - 1;
    let i;
    let slides = document.getElementsByClassName("mySlides");
    let dots = document.getElementsByClassName("dot");
    for (i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";  
    }
    for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" active", "");
    }
    slides[slideIndex].style.display = "block";  
    dots[slideIndex].className += " active";
}
</script>
</body>
</html>