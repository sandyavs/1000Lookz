<%-- 
    Document   : UpdateContest.jsp
    Created on : 2 Nov, 2017, 4:56:46 PM
    Author     : Anitha
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contest Updated</title>
    </head>
     <style>
         .back{   width: 25%;
                    background-color: #4CAF50;
                    color: white;
                    padding: 14px 20px;
                    margin: 8px 0;
                    border: none;
                    border-radius: 4px;
                    cursor: pointer;
      }
      .judge-1{
    position : center;	
    width:800px; 
    margin:0 auto;
    height : relative;
    text-align : center;
    background-color: #f2f2f2;
    padding: 20px;
    border-radius: 5px;
    
    font-size: 17px;
    font-weight : bold;
}
        
        
    </style>
    <body>
       <div class="judge-1"> 
        <%
Connection con = null;
try{
    String value1 = request.getParameter("contestid");   
    String value2= request.getParameter("venueid");
    String value3 = request.getParameter("time");
    String value4 = request.getParameter("room");
    Class.forName("oracle.jdbc.driver.OracleDriver");
    con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "rani1998");  
  
    PreparedStatement pst = con.prepareStatement("Update contest set contestid='"+value1+"', venueid='"+value2+"', time='"+value3+"',roomno='"+value4+"' where contestid='"+value1+"' ");
   
    
    ResultSet rs = pst.executeQuery();   
    out.println("Succesfully Updated");
  
           
}
catch(Exception e){       
   out.println("Couldn't Update Contest Please Try again");       
}      

%>

<br> <br>
<form action="admindetails.html">
    <input type="submit" value="Go Back." class="back">
</form>
</div>

    </body>
</html>
