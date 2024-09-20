<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
    <%@page import="java.util.*"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
try
{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ums?autoReconnect=true&useSSL=false",
			"root", "root");
	PreparedStatement ps=con.prepareStatement("Insert into users values(?,?,?,?,?,?)");
	ps.setString(1,request.getParameter("t1"));
	ps.setString(2,request.getParameter("t2"));
	ps.setString(3,request.getParameter("t3"));
	ps.setString(4,request.getParameter("t4"));
	ps.setString(5,request.getParameter("t5"));
	ps.setString(6,request.getParameter("t6"));

	
	
	  ps.executeUpdate();
	  
	  out.println("<h1>Your Account Is Created Succesfully</h1>");
	  %>

		<a href ="index.html">Back To Home!</a>
		<% 
		con.close();
	
}
catch(Exception ex)
{
 out.println(ex.getMessage());	
}
%>
</body>
</html>