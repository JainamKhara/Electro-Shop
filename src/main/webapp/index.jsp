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
<title>ElectroShop - Premium Electronics</title>
<link rel="stylesheet" href="Css/main_modern.css">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">

<style>
.hero-slider {
    position: relative;
    height: 550px;
    width: 100%;
    overflow: hidden;
    border-radius: 0;
    margin-bottom: 0; /* Align perfectly with content */
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
    height: 2px; width: 30px; /* Industrial bars instead of dots */
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
<form action="" method= "post">

	<%@ include file = "navbar.jsp" %>
	
	<div class="container" style="max-width: 1400px; margin: 0 auto; padding: 0 2rem;">
        <!-- Hero Slider -->
        <div class="hero-slider glass">
            <div class="mySlides fade">
                <img src="images/hometv.jpg">
                <div class="hero-overlay">
                    <h2 class="hero-title">Crystal Clear Entertainment</h2>
                    <p>Experience the next generation of Smart TVs.</p>
                </div>
            </div>
            <div class="mySlides fade">
                <img src="images/homelaptop.jpg">
                <div class="hero-overlay">
                    <h2 class="hero-title">Power Without Limits</h2>
                    <p>Premium laptops for work and play.</p>
                </div>
            </div>
            <div class="mySlides fade">
                <img src="images/homemobile.jpg">
                <div class="hero-overlay">
                    <h2 class="hero-title">Stay Connected</h2>
                    <p>The latest smartphones at your fingertips.</p>
                </div>
            </div>
            <div class="mySlides fade">
                <img src="images/homewatch.jpg">
                <div class="hero-overlay">
                    <h2 class="hero-title">Timed to Perfection</h2>
                    <p>Elegance and technology on your wrist.</p>
                </div>
            </div>

            <div class="dot-container">
                <span class="dot" onclick="currentSlide(1)"></span> 
                <span class="dot" onclick="currentSlide(2)"></span> 
                <span class="dot" onclick="currentSlide(3)"></span> 
                <span class="dot" onclick="currentSlide(4)"></span> 
            </div>
        </div>

        <h3 class="section-title">Featured Products</h3>
        
        <div class="product-grid">
            <%
            DAO2 dao = new DAO2(DBConnect.getConn());
            List<viewlist> listv = dao.getAllviewlist();
            for(viewlist v : listv)
                {%>
                <div class="product-card">
                    <div class="product-image-box">
                        <a href='selecteditem.jsp?Pn=<%=v.getPimage()%>'>
                            <img src='images/<%= v.getPimage() %>' alt="<%= v.getPname()%>">
                        </a>
                    </div>
                    <div class="product-info">
                        <div class="product-name">
                            <a href='selecteditem.jsp?Pn=<%=v.getPimage()%>'><%= v.getBname()%> <%= v.getPname()%></a>
                        </div>
                        <div style="display: flex; justify-content: space-between; align-items: center; margin-top: 1rem;">
                            <span class="product-price">Premium Quality</span>
                            <a href='selecteditem.jsp?Pn=<%=v.getPimage()%>' class="btn-primary" style="padding: 0.4rem 0.8rem; font-size: 0.9rem;">View</a>
                        </div>
                    </div>
                </div>
                <%}%>
        </div>
	</div>

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
      setTimeout(showSlides, 4000); 
    }
    </script>

	<%@ include file = "footer.jsp" %>

</form>
</body>
</html>