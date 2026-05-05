<%@ include file="validatelogina.jsp" %>
<%@ include file="cartnullqty.jsp" %>

<nav class="nav-container glass">
    <div class="nav-brand">
        <a href="adminhome.jsp">ELECTRO<span style="color: var(--primary)">SYSTEM</span></a>
        <span style="font-size: 0.75rem; color: var(--text-muted); margin-left: 1rem; border-left: 1px solid var(--glass-border); padding-left: 1rem;">
            ADMIN: <span style="color: var(--text-main)"><%= adminUserSession %></span>
        </span>
    </div>
    
    <div class="nav-links">
        <a href="adminhome.jsp">Dashboard</a>
        <a href="addproduct.jsp">Add Product</a>
        <a href="managecustomers.jsp">Customers</a>
        <a href="managetables.jsp">Database</a>
    </div>

    <div class="nav-links">
        <a href="cartnulla.jsp" class="cart-icon-wrapper">
            <img src="images/cart.png" height="24" alt="Cart" style="filter: invert(1); opacity: 0.8;">
            <span class="cart-badge"><%=tqty %></span>
        </a>
        <a href="adminlogin.jsp" style="font-size: 0.75rem; opacity: 0.6; text-transform: uppercase; letter-spacing: 0.1em;">Logout</a>
    </div>
</nav>

<div class="container" style="padding: 1rem 3rem; display: flex; gap: 2rem; justify-content: center; background: #000; margin-bottom: 2rem; border-bottom: 1px solid var(--glass-border);">
    <a href="tva.jsp" style="font-size: 0.75rem; text-transform: uppercase; letter-spacing: 0.1em; color: var(--text-muted);">Inventory TV</a>
    <a href="laptopa.jsp" style="font-size: 0.75rem; text-transform: uppercase; letter-spacing: 0.1em; color: var(--text-muted);">Inventory Laptop</a>
    <a href="mobilea.jsp" style="font-size: 0.75rem; text-transform: uppercase; letter-spacing: 0.1em; color: var(--text-muted);">Inventory Mobile</a>
    <a href="watcha.jsp" style="font-size: 0.75rem; text-transform: uppercase; letter-spacing: 0.1em; color: var(--text-muted);">Inventory Watch</a>
</div>