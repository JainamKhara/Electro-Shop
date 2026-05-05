package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.conn.DBConnect;
import com.dao.DAO5;

@WebServlet("/UpdateOrderStatus")
public class UpdateOrderStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateOrderStatus() {
        super();
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String status = request.getParameter("status");
		
		DAO5 dao = new DAO5(DBConnect.getConn());
		if(dao.updateOrderStatus(id, status) > 0) {
			response.sendRedirect("table_orders.jsp");
		} else {
			response.sendRedirect("table_orders.jsp?msg=Failed to update status");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
