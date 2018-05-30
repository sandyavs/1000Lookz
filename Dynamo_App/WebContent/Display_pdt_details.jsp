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
	<caption><h2>PRODUCT DETAILS</h2></caption>
		<tr>
		<th>Product type</th>
		<th>Product_name</th>
		<th>Product Details</th>
		<th>Cost</th>
		<th>Stock</th>
		</tr>
	<% 
	Connection conn_dis=null;
	try{
	String c1_id=(String)session.getAttribute("id2_id");
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn_dis= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "sandy1998", "track225");
	PreparedStatement pst_dis=conn_dis.prepareStatement("Select * from Retailer_Product_Details where Company_ID=?");
	pst_dis.setString(1,c1_id);
	ResultSet rs_dis=pst_dis.executeQuery();
	
	 while(rs_dis.next())
	 {
	   
		 %>
			<tr>
			<td> <%= rs_dis.getString(1) %></td>
		    <td><%=rs_dis.getString(2) %></td>
		    <td><%=rs_dis.getString(4) %></td>
		    <td><%=rs_dis.getString(5) %></td>
		    <td><%=rs_dis.getString(6) %></td>		    
		    </tr>
   <%
   } 
   %>       
	</table>
	
   
<%		rs_dis.close();
     conn_dis.close();
}
catch(Exception e)
{
     e.printStackTrace();
}

%>
</body>
</html>