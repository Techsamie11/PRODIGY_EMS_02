<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.sql.*"%>  
<%@ include file="DbConnection.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Page</title>
</head>
<body>
<h1>Delete</h1>
<%
	String id=request.getParameter("id");
	//out.println(id);
	PreparedStatement pstmt;
	try {
	    pstmt=con.prepareStatement("delete from employee_details where emp_id="+id);
	    int r=pstmt.executeUpdate();
	    if(r<1){
	    	String msg = "Error";
	    	System.err.println("Error");
	    	response.sendRedirect("employee_details.jsp");
	    }else{
	    	String msg = "Data Inserted Successfully";
	    	System.out.println("Delete Successfully...");
	    	response.sendRedirect("employee_details.jsp");
	    }
	}catch(Exception e){
		System.out.println(e);
	}
%>
</body>
</html>