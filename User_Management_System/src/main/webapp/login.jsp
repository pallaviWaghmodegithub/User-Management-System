<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LogIn</title>
</head>
<body>
<%
try
{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ums?autoReconnect=true&useSSL=false","root","root");
	PreparedStatement ps=con.prepareStatement("select *from users where user_name=? and password=?");
	ps.setString(1,request.getParameter("t1"));
	ps.setString(2,request.getParameter("t2"));
	
	ResultSet rs=ps.executeQuery();
	if(rs.next())
	{
		out.println("<h1>Welcome"+rs.getString(1)+"</h1>");
		out.println("<h1>Your Details...</h1>");
		out.println("<h1>User_Name="+rs.getString(1));
		out.println("<h1>Email="+rs.getString(2));
		out.println("<h1>Password="+rs.getString(3));
		%>
		
		<br><br>
		<a href="/index/Home.html">You Can Logout Successfully</a>
		<%
	}
	else
		
		
	{
		out.println("<h1>Your Account Details Not Matched</h1>");
		%>
      <a href ="index.html">Back To Home!</a>	
      
      	<%
      	rs.close();	
    	con.close();
		}
	
	
}
catch(Exception e)
{
out.println(e);
}

%>
</body>
</html>