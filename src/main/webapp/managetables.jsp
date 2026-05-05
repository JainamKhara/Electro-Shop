<%@page import="com.dao.DAO3"%>
<%@page import="com.entity.tv"%>
<%@page import="java.util.List"%>
<%@page import="com.conn.DBConnect"%>
<%@page import="java.sql.*,java.io.*,java.text.*,java.util.*" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Database Management - ElectroShop Admin</title>
<link rel="stylesheet" href="Css/main_modern.css">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
<style>
    .db-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
        gap: 1px;
        background: var(--glass-border);
        border: 1px solid var(--glass-border);
    }
    .db-card {
        background: var(--bg-card);
        padding: 3rem;
        transition: all 0.3s ease;
        display: flex;
        flex-direction: column;
        justify-content: space-between;
    }
    .db-card:hover {
        background: #1d1d1d;
    }
    .db-label {
        font-size: 0.7rem;
        text-transform: uppercase;
        letter-spacing: 0.2em;
        color: var(--primary);
        font-weight: 800;
        margin-bottom: 1rem;
    }
    .db-title {
        font-size: 1.5rem;
        font-weight: 900;
        text-transform: uppercase;
        margin-bottom: 1.5rem;
    }
    .db-desc {
        font-size: 0.875rem;
        color: var(--text-muted);
        line-height: 1.6;
        margin-bottom: 2.5rem;
    }
</style>
</head>
<body>
<form action="" method="post">
    <%@ include file="admin_navbar.jsp" %>

    <div class="container" style="margin-top: 4rem;">
        <div style="margin-bottom: 4rem; border-left: 4px solid var(--primary); padding-left: 2rem;">
            <h1 style="font-size: 2.5rem; font-weight: 900; text-transform: uppercase; letter-spacing: -0.01em;">Database Terminal</h1>
            <p style="color: var(--text-muted); margin-top: 0.5rem; font-weight: 500;">Direct access to system tables and relational data records.</p>
        </div>

        <div class="db-grid">
            <div class="db-card">
                <div>
                    <div class="db-label">Relational Table</div>
                    <h3 class="db-title">Cart Ledger</h3>
                    <p class="db-desc">View and manage temporary procurement records and active operator cart sessions.</p>
                </div>
                <a href="table_cart.jsp" class="btn-primary" style="text-align: center; padding: 1rem; font-size: 0.75rem;">ACCESS TABLE</a>
            </div>

            <div class="db-card">
                <div>
                    <div class="db-label">Transaction Table</div>
                    <h3 class="db-title">Order Registry</h3>
                    <p class="db-desc">Centralized repository for all completed transaction manifests and fulfillment statuses.</p>
                </div>
                <a href="table_orders.jsp" class="btn-primary" style="text-align: center; padding: 1rem; font-size: 0.75rem;">ACCESS TABLE</a>
            </div>

            <div class="db-card">
                <div>
                    <div class="db-label">Detailed Ledger</div>
                    <h3 class="db-title">Itemized Manifests</h3>
                    <p class="db-desc">Atomic breakdown of every product included in the global order history.</p>
                </div>
                <a href="table_order_details.jsp" class="btn-primary" style="text-align: center; padding: 1rem; font-size: 0.75rem;">ACCESS TABLE</a>
            </div>

            <div class="db-card">
                <div>
                    <div class="db-label">Communication Table</div>
                    <h3 class="db-title">Inquiry Logs</h3>
                    <p class="db-desc">Record of all technical support inquiries and external operator communications.</p>
                </div>
                <a href="table_contactus.jsp" class="btn-primary" style="text-align: center; padding: 1rem; font-size: 0.75rem;">ACCESS TABLE</a>
            </div>
        </div>
    </div>

    <%@ include file="footer.jsp" %>
</form>
</body>
</html>