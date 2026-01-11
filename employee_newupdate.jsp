<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*"%>  
<%@ include file="DbConnection.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<% 
    String updt_id= request.getParameter("ID");
	String enm= request.getParameter("enm");
	String email= request.getParameter("email");
	String mob= request.getParameter("mob");
	String gender= request.getParameter("gender");
	Date dob_join = Date.valueOf(request.getParameter("date_of_joining"));
	String status= request.getParameter("status");
	String department= request.getParameter("department");
	String designation= request.getParameter("designation");
	double salary=Double.parseDouble(request.getParameter("salary"));
	
	PreparedStatement pstmt;
	
	try{
		pstmt=con.prepareStatement("update employee_details set emp_name=?, email=?, mobile=?, gender=?, dob_join=?, status=?, department=?, designation=?, salary=? where emp_id="+updt_id);
	    pstmt.setString(1, enm);
	    pstmt.setString(2, email);
	    pstmt.setString(3, mob);
	    pstmt.setString(4, gender);
	    pstmt.setDate(5, dob_join);
	    pstmt.setString(6, status);
	    pstmt.setString(7, department);
	    pstmt.setString(8, designation);
	    pstmt.setDouble(9, salary);
	    
	    int r=pstmt.executeUpdate();
	    if(r<1){
	    	
	    	System.err.println("Error");
	    	response.sendRedirect("employee_details.jsp");
	    }else{
	    	
	    	System.out.println("Insert Successfully...");
	    	response.sendRedirect("employee_details.jsp");
	    }
	}catch(Exception e){
		System.out.println("Error:"+e);
	}
%>

</body>
</html>