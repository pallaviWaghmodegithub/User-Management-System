<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import ="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Remove Account</title>
</head>
<body> 
     <%
       try{
    	   Class.forName("com.mysql.cj.jdbc.Driver");
    	   Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ums?autoReconnect=true&useSSL=false","root","root");
    	   PreparedStatement Ps=con.prepareStatement("SELECT * FROM  users WHERE user_name=? AND password=?");
    	   Ps.setString(1,request.getParameter("t1"));
    	   Ps.setString(2,request.getParameter("t2"));
    	   ResultSet rs=Ps.executeQuery();
    	   
    	    if(rs.next()){
    	    	out.println("<h1>Account Removed Successfully....</h1>");
    	   
             PreparedStatement ps=con.prepareStatement("DELETE FROM users WHERE user_name=? AND password=?");
    	    	ps.setString(1,request.getParameter("t1"));
    	    	ps.setString(2,request.getParameter("t2"));
    	    	ps.executeUpdate();

    	    }
    	    else
    	    {
    	    	out.println("<h1>Details Not Matched .. Account Removal Failed..</h1>");

    	    }
    	   
    	    rs.close();
    	    Ps.close();
    	    con.close();
    	   
    	    }catch(Exception e){
    	    e.printStackTrace();
    	    out.println("<h1>style='color:red;'>An error occured:"+e.getMessage()+"<h1>");
    	   

       }
     %>

</body>
</html>