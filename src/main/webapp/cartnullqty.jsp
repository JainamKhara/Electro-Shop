<%@page import="com.entity.cart"%>
<%@page import="java.util.List"%>
<%@page import="com.conn.DBConnect"%>
<%@page import="com.dao.DAO2"%>
<%
int tqty= 0;
DAO2 daocnqty = new DAO2(DBConnect.getConn());
List<cart> listq = daocnqty.getSelectedcart();
for(cart v : listq)
{
	tqty = tqty + v.getPquantity();
} %>