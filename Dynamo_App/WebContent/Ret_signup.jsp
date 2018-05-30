<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	Connection conn_rs=null;
try{
	String cname = request.getParameter("Cname");
    System.out.println(cname);
    
    String rname=request.getParameter("Rname");
    System.out.println(rname);
    
    String cid=request.getParameter("cid");
    System.out.println(cid);


    String Pass = request.getParameter("Password");
    System.out.println(Pass);
    
    String number=request.getParameter("mobile");
    System.out.println(number);
    
    String caddr=request.getParameter("addr");
    System.out.println(caddr);
    
    Class.forName("oracle.jdbc.driver.OracleDriver");
    conn_rs= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "sandy1998", "track225"); 
    PreparedStatement pst_rs = conn_rs.prepareStatement("Select Company_ID from Retailer_Register where Company_ID=? ");
     pst_rs.setString(1,cid);
         
     session.setAttribute("CName",cname);
     session.setAttribute("RName",rname);
     session.setAttribute("CID",cid);
     session.setAttribute("PASS1",Pass);
     session.setAttribute("mnum", number);
     session.setAttribute("addr",caddr);

     
     
    ResultSet rs_rs= pst_rs.executeQuery();   
    
    %>  <% if( rs_rs.next()) {  %>
    <%@ include file="ExistSignup.jsp"%>
     <% }else { %>
     <%@  include file="Ret_InsertReg.jsp"%>
     <% }
           
}

catch(Exception e){       
   out.println(e); 
   conn_rs.close();
}      
conn_rs.close();
%>
</body>
</html>