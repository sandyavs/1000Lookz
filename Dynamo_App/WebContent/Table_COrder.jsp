<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<table border="1" width="100%">

	<caption><h2>ORDER DETAILS</h2></caption>
		<tr>
		<th>Order ID</th>
		<th>Product_name</th>
		<th>Product_Details</th>
		<th>Quantity</th>
		<th>Cost</th>
		<th>Payment Mode</th>
		<th>Delivery Address</th>
		</tr>

	<%
	Connection conn_ot=null;
	
		try{
		String order_name=(String)session.getAttribute("User");
		out.println("table:"+order_name);
		
		String pname=(String)session.getAttribute("Order_Product");
		out.println(pname);
		
		Integer quantity_order=(Integer)session.getAttribute("quan_order");
		
		String or_da=(String)session.getAttribute("or_date");
		
		String del_bill=(String)session.getAttribute("or_bill");
		
		String adr_del=(String)session.getAttribute("del_addr");
		
		Integer amount=(Integer)session.getAttribute("amt_order");
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn_ot= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "sandy1998", "track225");
		PreparedStatement pst_ot=conn_ot.prepareStatement("Select Order_ID,P_Name,P_Details,Quantity_Ordered,P_cost,Billing_Type,Delivery_Address from (Select * from RETAILER_PRODUCT_DETAILS natural join  CUSTOMER_ORDER_TOTALCOST natural join CUSTOMER_ORDER_DETAILS) where Username=? ");
		pst_ot.setString(1,order_name);
		ResultSet rs_ot=pst_ot.executeQuery();
		
		PreparedStatement pst_ot1=conn_ot.prepareStatement("Select distinct sum(Amount) as Total from CUSTOMER_ORDER_TOTALCOST where Username=?");
	   	pst_ot1.setString(1,order_name);
	   	ResultSet rs_ot1=pst_ot1.executeQuery();
	   	int amt=0;
	   	
	if(rs_ot1.next())
   		 amt=rs_ot1.getInt("Total");

	
	   	
		while(rs_ot.next()){
			%>
			<tr>
			<td><%=rs_ot.getString(1) %>
			<td> <%= rs_ot.getString(2)%></td>
		    <td><%=rs_ot.getString(3) %></td>
		    <td><%=rs_ot.getString(4) %></td>
		    <td><%=rs_ot.getString(5) %></td>
		    <td><%=rs_ot.getString(6) %></td>
		    <td><%=rs_ot.getString(7)%></td>
		    </tr>
      <%
      } 
      %> 
      <center><b>
		    	AMOUNT_PAYABLE:<%= amt %>
		    	</b>
		</center>
	
	</table>
      
<%
        rs_ot.close();
		rs_ot1.close();
        conn_ot.close();
   }
   catch(Exception e)
   {
        e.printStackTrace();
   }

   %>
   
   <form name="cancel" action="" method="post">
		<input type="submit" value="Cancel Order" >
	</form>
		

				
	
</center>

</body>
</html>