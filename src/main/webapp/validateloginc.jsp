<%@page import="com.entity.cart"%>
<%@page import="com.dao.DAO2"%>
<%@page import="com.entity.customer"%>
<%@page import="com.conn.DBConnect"%>
<%@page import="com.dao.DAO"%>
<%@page import="java.sql.*,java.io.*,java.text.*,java.util.*" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String cartTotalValue = request.getParameter("Total");
    String cartCustomerName = request.getParameter("CusName");
    String customerUserSession = null;
    String customerDisplayName = null;
    
    if(request.getCookies() != null) {
        Cookie[] customerCookies = request.getCookies();
        int isCustomerAuthenticated = 0;
        for(int i = 0; i < customerCookies.length; i++) {
            if(customerCookies[i].getName().equals("cname")) {
                isCustomerAuthenticated = 1;
                customerUserSession = customerCookies[i].getValue();
                
                DAO customerAccessDAO = new DAO(DBConnect.getConn());
                List<customer> matchingCustomers = customerAccessDAO.getCustomer(customerUserSession);
                for(customer customerEntity : matchingCustomers) {
                    customerDisplayName = customerEntity.getName();	
                }
            }
        }
        if(isCustomerAuthenticated != 1) {
            response.sendRedirect("customerlogin.jsp?Total=" + cartTotalValue + "&CusName=" + cartCustomerName);
            return;
        }
    } else {
        response.sendRedirect("customerlogin.jsp?Total=" + cartTotalValue + "&CusName=" + cartCustomerName);
        return;
    }

    int totalCartQuantity = 0;
    DAO2 cartQuantityDAO = new DAO2(DBConnect.getConn());
    List<cart> customerCartItems = cartQuantityDAO.getcart(customerDisplayName);
    for(cart cartEntry : customerCartItems) {
        totalCartQuantity = totalCartQuantity + cartEntry.getPquantity();
    }
%>
<input type="hidden" name="Total" value="<%= cartTotalValue != null ? cartTotalValue : "" %>">
<input type="hidden" name="CusName" value="<%= cartCustomerName != null ? cartCustomerName : "" %>">