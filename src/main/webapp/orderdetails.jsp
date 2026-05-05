<%@page import="com.entity.order_details"%>
<%@page import="com.entity.orders"%>
<%@page import="com.conn.DBConnect"%>
<%@page import="com.dao.DAO3"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Details - ElectroShop</title>
<link rel="stylesheet" href="Css/main_modern.css">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
<style>
    .order-summary-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
        gap: 1px;
        background: var(--glass-border);
        border: 1px solid var(--glass-border);
        margin-bottom: 4rem;
    }
    .summary-item {
        background: var(--bg-card);
        padding: 2rem;
    }
    .summary-label {
        font-size: 0.7rem;
        text-transform: uppercase;
        letter-spacing: 0.1em;
        color: var(--text-muted);
        font-weight: 800;
        margin-bottom: 0.5rem;
    }
    .summary-value {
        font-size: 1.25rem;
        font-weight: 700;
    }
</style>
</head>
<body>
<form method="post" action="payprocess.jsp">
    <%@ include file="customer_navbar.jsp" %>

    <div class="container" style="margin-top: 4rem;">
        <div style="margin-bottom: 3rem;">
            <h1 style="font-size: 2rem; font-weight: 900; text-transform: uppercase; letter-spacing: 0.1em;">Order Manifest</h1>
            <p style="color: var(--text-muted); margin-top: 0.5rem;">Detailed breakdown of transaction ledger and fulfillment status.</p>
        </div>

        <% 
            String d = request.getParameter("id");
            DAO3 dao = new DAO3(DBConnect.getConn());
            List<orders> listv = dao.getOrdersbydate(d);
            for(orders v : listv) {
        %>
        <div class="order-summary-grid">
            <div class="summary-item">
                <div class="summary-label">Customer</div>
                <div class="summary-value"><%= v.getCustomer_Name() %></div>
            </div>
            <div class="summary-item">
                <div class="summary-label">Location</div>
                <div class="summary-value"><%= v.getCustomer_City() %></div>
            </div>
            <div class="summary-item">
                <div class="summary-label">Timestamp</div>
                <div class="summary-value" style="font-size: 1rem;"><%= v.getDate() %></div>
            </div>
            <div class="summary-item">
                <div class="summary-label">Total Amount</div>
                <div class="summary-value" style="color: var(--primary);">₹ <%= v.getTotal_Price() %></div>
            </div>
            <div class="summary-item">
                <div class="summary-label">Status</div>
                <div>
                    <span class="status-badge <%= v.getStatus().equalsIgnoreCase("Success") ? "status-success" : "status-pending" %>">
                        <%= v.getStatus() %>
                    </span>
                </div>
            </div>
        </div>
        <% } %>

        <h3 class="section-title" style="padding: 0; margin-bottom: 2rem;">Itemized Ledger</h3>
        <div class="glass" style="padding: 1px; background: var(--glass-border);">
            <table class="industrial-table">
                <thead>
                    <tr>
                        <th>Date</th>
                        <th>Product Details</th>
                        <th>Category</th>
                        <th>Unit Price</th>
                        <th>Qty</th>
                        <th style="text-align: right;">Subtotal</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        int totalSum = 0;
                        List<order_details> listd = dao.getOrderdetails(d);
                        for(order_details v : listd) {
                    %>
                    <tr>
                        <td style="color: var(--text-muted); font-size: 0.8rem;"><%= v.getDate() %></td>
                        <td>
                            <div style="display: flex; align-items: center; gap: 1.5rem;">
                                <div style="background: #fff; padding: 0.5rem; border: 1px solid var(--glass-border);">
                                    <img src="images/<%= v.getPimage() %>" height="40" width="40" style="object-fit: contain;">
                                </div>
                                <div>
                                    <div style="font-weight: 700;"><%= v.getPname() %></div>
                                    <div style="font-size: 0.75rem; color: var(--text-muted); text-transform: uppercase;"><%= v.getBname() %></div>
                                </div>
                            </div>
                        </td>
                        <td><%= v.getCname() %></td>
                        <td>₹ <%= v.getPprice() %></td>
                        <td><%= v.getPquantity() %></td>
                        <td style="text-align: right; font-weight: 700;">₹ <%= v.getPprice() * v.getPquantity() %></td>
                    </tr>
                    <% 
                            totalSum += v.getPprice() * v.getPquantity();
                        } 
                    %>
                </tbody>
                <tfoot>
                    <tr style="background: #000;">
                        <td colspan="5" style="padding: 1.5rem; text-align: right; font-weight: 800; text-transform: uppercase; letter-spacing: 0.1em; color: var(--text-muted);">Grand Total</td>
                        <td style="padding: 1.5rem; text-align: right; font-size: 1.25rem; font-weight: 900; color: var(--primary);">₹ <%= totalSum %></td>
                    </tr>
                </tfoot>
            </table>
        </div>
    </div>

    <%@ include file="footer.jsp" %>
</form>
</body>
</html>