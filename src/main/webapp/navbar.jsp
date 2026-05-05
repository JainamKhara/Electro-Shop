<%@ include file="cartnullqty.jsp" %>
<nav class="nav-container glass">
    <div class="nav-brand">
        <a href="index.jsp">ELECTRO<span style="color: var(--primary)">SHOP</span></a>
    </div>
    
    <div class="nav-links">
        <a href="index.jsp">Home</a>
        <a href="viewproduct.jsp">Products</a>
        <a href="aboutus.jsp">About</a>
        <a href="contactus.jsp">Contact</a>
    </div>

    <div class="nav-links">
        <a href="cartnull.jsp" class="cart-icon-wrapper">
            <img src="images/cart.png" height="24" alt="Cart" style="filter: invert(1); opacity: 0.8;">
            <span class="cart-badge"><%=tqty %></span>
        </a>
        <a href="customer_reg.jsp" style="font-size: 0.875rem;">Join</a>
        <a href="customerlogin.jsp" class="btn-primary">Sign In</a>
        <a href="adminlogin.jsp" style="font-size: 0.75rem; opacity: 0.4;">Portal</a>
    </div>
</nav>


	
