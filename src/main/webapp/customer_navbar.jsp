<%@ include file="validateloginc.jsp" %>

<input type="hidden" name="Total" value="<%= cartTotalValue != null ? cartTotalValue : "" %>">
<input type="hidden" name="CusName" value="<%= cartCustomerName != null ? cartCustomerName : "" %>">

<nav class="nav-container glass">
    <div class="nav-brand">
        <a href="customerhome.jsp">ELECTRO<span style="color: var(--primary)">SHOP</span></a>
        <span style="font-size: 0.75rem; color: var(--text-muted); margin-left: 1rem; border-left: 1px solid var(--glass-border); padding-left: 1rem; text-transform: uppercase; letter-spacing: 0.1em;">
            OPERATOR: <span style="color: var(--text-main); font-weight: 800;"><%= customerDisplayName %></span>
        </span>
    </div>
    
    <div class="nav-links">
        <a href="customerhome.jsp">Overview</a>
        <a href="viewproductc.jsp">All Products</a>
        <a href="orders.jsp">My Orders</a>
        <a href="contactusc.jsp">Support</a>
    </div>

    <div class="nav-links">
        <a href="cart.jsp" class="cart-icon-wrapper">
            <img src="images/cart.png" height="20" alt="Cart" style="filter: invert(1); opacity: 0.8;">
            <span class="cart-badge"><%= totalCartQuantity %></span>
        </a>
        <a href="customerlogin.jsp" class="btn-primary" style="padding: 0.5rem 1rem; font-size: 0.7rem; background: transparent; border-color: var(--glass-border); color: var(--text-muted);">LOGOUT_SESSION</a>
    </div>
</nav>

<div style="background: var(--bg-card); border-bottom: 1px solid var(--glass-border); padding: 0.75rem 0;">
    <div class="container" style="display: flex; gap: 3rem; justify-content: center;">
        <a href="tvc.jsp" style="font-size: 0.7rem; text-transform: uppercase; letter-spacing: 0.2em; color: var(--text-muted); font-weight: 700;">// TVS</a>
        <a href="laptopc.jsp" style="font-size: 0.7rem; text-transform: uppercase; letter-spacing: 0.2em; color: var(--text-muted); font-weight: 700;">// LAPTOPS</a>
        <a href="mobilec.jsp" style="font-size: 0.7rem; text-transform: uppercase; letter-spacing: 0.2em; color: var(--text-muted); font-weight: 700;">// MOBILES</a>
        <a href="watchc.jsp" style="font-size: 0.7rem; text-transform: uppercase; letter-spacing: 0.2em; color: var(--text-muted); font-weight: 700;">// WATCHES</a>
    </div>
</div>