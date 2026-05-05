<%@page import="com.entity.category"%>
<%@page import="com.entity.brand"%>
<%@page import="java.util.List"%>
<%@page import="com.conn.DBConnect"%>
<%@page import="com.dao.DAO"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Product - ElectroShop Admin</title>
<link rel="stylesheet" href="Css/main_modern.css">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
</head>
<body>
<form method="post" action="addproduct" enctype="multipart/form-data">
    <%@ include file="admin_navbar.jsp" %>

    <div class="container" style="margin-top: 6rem; max-width: 800px;">
        <div style="margin-bottom: 4rem; border-left: 4px solid var(--primary); padding-left: 2rem;">
            <h1 style="font-size: 2.5rem; font-weight: 900; text-transform: uppercase; letter-spacing: -0.01em;">Inventory Entry</h1>
            <p style="color: var(--text-muted); margin-top: 0.5rem; font-weight: 500;">Register new high-performance hardware into the global database.</p>
        </div>

        <div class="form-container" style="margin: 0; width: 100%; max-width: none;">
            <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 2rem;">
                <div class="form-group">
                    <label>Select Brand</label>
                    <select name="bname" class="form-input" style="height: 54px;">
                        <% 
                            DAO dao = new DAO(DBConnect.getConn());
                            List<brand> listb = dao.getAllbrand();
                            for(brand b : listb) {
                        %>
                        <option><%= b.getBname() %></option>
                        <% } %>
                    </select>
                </div>

                <div class="form-group">
                    <label>Select Category</label>
                    <select name="cname" class="form-input" style="height: 54px;">
                        <%
                            List<category> listc = dao.getAllcategory();
                            for(category c : listc) {
                        %>
                        <option><%= c.getCname() %></option>
                        <% } %>
                    </select>
                </div>
            </div>

            <div class="form-group">
                <label>Product Designation (Name)</label>
                <input type="text" name="pname" class="form-input" placeholder="e.g. Quantum Laptop X1" required>
            </div>

            <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 2rem;">
                <div class="form-group">
                    <label>Unit Price (INR)</label>
                    <input type="number" name="pprice" class="form-input" placeholder="00000" required>
                </div>

                <div class="form-group">
                    <label>Initial Quantity</label>
                    <input type="number" value="1" name="pquantity" class="form-input" readonly style="opacity: 0.5; background: #222;">
                </div>
            </div>

            <div class="form-group">
                <label>Technical Schematics (Product Image)</label>
                <div style="border: 1px dashed var(--glass-border); padding: 2rem; text-align: center; background: #111;">
                    <input type="file" name="pimage" required style="font-size: 0.8rem; color: var(--text-muted);">
                    <p style="font-size: 0.7rem; color: var(--text-muted); margin-top: 1rem; text-transform: uppercase; letter-spacing: 0.1em;">JPEG / PNG / WebP formats supported</p>
                </div>
            </div>

            <div style="margin-top: 3rem;">
                <button type="submit" class="btn-primary" style="width: 100%; padding: 1.25rem; font-size: 0.875rem; letter-spacing: 0.2em;">
                    DISPATCH TO INVENTORY
                </button>
            </div>
        </div>
    </div>

    <%@ include file="footer.jsp" %>
</form>
</body>
</html>