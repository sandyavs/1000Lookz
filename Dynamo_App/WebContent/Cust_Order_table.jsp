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
	Connection conn_o6=null;
	
		try{
		String order_id=(String)session.getAttribute("owner_order");
		out.println("table:"+order_id);
		
		String pname_id=(String)session.getAttribute("oprd_id");
		out.println(pname_id);
		
		Integer quantity_order=(Integer)session.getAttribute("quan_order");
		
		String or_da=(String)session.getAttribute("or_date");
		
		String del_bill=(String)session.getAttribute("or_bill");
		
		String adr_del=(String)session.getAttribute("del_addr");
		
		Integer amount=(Integer)session.getAttribute("amt_order");
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn_o6= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "sandy1998", "track225");
		PreparedStatement pst_o6=conn_o6.prepareStatement("Select Order_ID,P_Name,P_Details,Quantity_Ordered,P_cost,Billing_Type,Delivery_Address from (Select * from RETAILER_PRODUCT_DETAILS natural join  CUSTOMER_ORDER_TOTALCOST natural join CUSTOMER_ORDER_DETAILS) where Order_ID=? ");
		pst_o6.setString(1,order_id);
		ResultSet rs_o6=pst_o6.executeQuery();
		
		PreparedStatement pst_o7=conn_o6.prepareStatement("Select distinct sum(Amount) as Total from CUSTOMER_ORDER_TOTALCOST where Order_ID=? group by Order_ID");
	   	pst_o7.setString(1,order_id);
	   	ResultSet rs_o7=pst_o7.executeQuery();
	   	int amt=0;
	   	
	   		   	
	if(rs_o7.next())
   		 amt=rs_o7.getInt("Total");

	
	   	
		while(rs_o6.next()){
			%>
			<tr>
			<td><%=rs_o6.getString(1) %></td>
			<td> <%= rs_o6.getString(2)%></td>
		    <td><%=rs_o6.getString(3) %></td>
		    <td><%=rs_o6.getString(4) %></td>
		    <td><%=rs_o6.getString(5) %></td>
		    <td><%=rs_o6.getString(6) %></td>
		    <td><%=rs_o6.getString(7)%></td>
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
        rs_o6.close();
		rs_o7.close();
        conn_o6.close();
   }
   catch(Exception e)
   {
        e.printStackTrace();
   }

   %>
   
   <form name="back cart" action="Table_Ccart.jsp" method="post">
		<input type="submit" value="Go Back" >
	</form>
		

				
	
</center>

</body>
</html>