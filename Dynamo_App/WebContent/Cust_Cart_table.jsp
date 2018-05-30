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
	Connection conn5=null;
	
		try{
		String c_user=(String)session.getAttribute("name_c");
		
		String c_id=(String)session.getAttribute("c_pro");
		
		Integer amount=(Integer)session.getAttribute("tot_cost");
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn5= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "sandy1998", "track225");
		PreparedStatement pst5=conn5.prepareStatement("Select * from CUSTOMER_CART_PRODUCT where Username=?");
		pst5.setString(1,c_user);
		ResultSet rs5=pst5.executeQuery();
PreparedStatement pst_a2=conn5.prepareStatement("Select distinct sum(Amount) as Total from Customer_Cart_Details where Username=? group by Username");
	   	pst_a2.setString(1,c_user);
	   	ResultSet rs_a2=pst_a2.executeQuery();
	   	int amt=0;
	   	
	if(rs_a2.next())
   		 amt=rs_a2.getInt("Total");
	
		while(rs5.next()){
			String n1=rs5.getString(1);
			String n2=rs5.getString(2);
			String n3=rs5.getString(3);
			session.setAttribute("n1_name",n1);
			session.setAttribute("n2_pid",n2);
			session.setAttribute("n3_quan",n3);
			%>
			<tr>
			<td> <%= rs5.getString(3) %></td>
		    <td><%=rs5.getInt(8) %></td>
		    <td><%=rs5.getInt(9) %></td>
		    </tr>
      <%
      } 
      %>    	
   		<center><b>
		    	TOTAL_AMOUNT:<%= amt %>
		    	</b>
		</center>
	
	</table>
      
<%
        rs5.close();
        conn5.close();
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