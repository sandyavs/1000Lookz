

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
Connection conn_ex = null;
try{
	String value5=request.getParameter("Ptype");
	out.println(value5);
	String value6=request.getParameter("Pname");
	out.println(value6);
    String value1 = request.getParameter("Pid"); 
    out.println(value1);
    String value2= request.getParameter("P_details");
    out.println(value2);
    String value3 = request.getParameter("P_cost");
    out.println(value3);
    String value4 = request.getParameter("quantity");
    out.println(value4);
    

    Class.forName("oracle.jdbc.driver.OracleDriver");
    conn_ex = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "sandy1998", "track225");  
  
PreparedStatement pst_ex = conn_ex.prepareStatement("Update Retailer_Product_details set P_type='"+value5+"',P_Name='"+value6+"', P_Details='"+value2+"', P_cost ='"+value3+"',Quantity_Supplied='"+value4+"' where  P_ID='"+value1+"' ");
   
    //pst_ex.executeUpdate();
    ResultSet rs_ex = pst_ex.executeQuery(); 
    out.println("Update is done successfully");
    
  
           
}
catch(Exception e){       
   out.println(e);       
}      

%>
    </body>
</html>