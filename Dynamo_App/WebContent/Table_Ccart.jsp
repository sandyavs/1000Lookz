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
	<caption><h2>CART DETAILS</h2></caption>
		<tr>
		<th>Product_name</th>
		<th>Quantity</th>
		<th>Amount</th>
		</tr>
	<%
	Connection conn_c=null;
	
		try{
		String c_user=(String)session.getAttribute("User");
		
		//String pname=(String)session.getAttribute("Product");
		
		Integer amount=(Integer)session.getAttribute("total");
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn_c= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "sandy1998", "track225");
		PreparedStatement pst_c=conn_c.prepareStatement("Select * from CUSTOMER_CART_PRODUCT where Username=? ");
		pst_c.setString(1,c_user);
		ResultSet rs_c=pst_c.executeQuery();
		session.setAttribute("co_user",c_user);
		
		PreparedStatement pst_c1=conn_c.prepareStatement("Select distinct sum(Amount) as Total from Customer_Cart_Details where Username=? group by Username");
	   	pst_c1.setString(1,c_user);
	   	ResultSet rs_c1=pst_c1.executeQuery();
	   	int amt=0;
	   	
	if(rs_c1.next())
   		 amt=rs_c1.getInt("Total");

	   	
		while(rs_c.next()){
			%>
			<tr>
			<td> <%= rs_c.getString(3) %></td>
		    <td><%=rs_c.getInt(8) %></td>
		    <td><%=rs_c.getInt(9) %></td>
		    </tr>
      <%
      } 
      %>       
	</table>
	<center><b>
		    	TOTAL_AMOUNT:<%= amt %>
		    	</b>
		</center>
      
<%		rs_c1.close();
        rs_c.close();
        conn_c.close();
   }
   catch(Exception e)
   {
        e.printStackTrace();
   }

   %>
   
   <form name="back cart" action="Cust_Cart_table.jsp" method="post">
		<input type="submit" value="Go Back" >
	</form>
		
	<center>
		<form name="add customer cart" action="Ccart1.jsp" method="post">
		<input type="submit" value="Add Cart" >
		</form>
		
		<form name="update customer cart" action="Update_Cust_Cart.jsp" method="post">
			<input type="submit" value="Update Cart" >
		</form>
		
		<form name="delete customer cart" action="Delete_Cust_Cart.jsp" method="post">
			<input type="submit" value="Delete" >
		</form>
		
		<form name="payment" action="Cust_Cart_Order.jsp" method="post">
			<input type="submit" value="Proceed to pay" >
		</form>
		
	</center>	
</center>

</body>
</html>