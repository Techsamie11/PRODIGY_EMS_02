<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.sql.*"%>  
<%@ include file="DbConnection.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employee Details</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

<script type="text/javascript">
function del(id){
    if(confirm("⚠ Are you sure you want to delete this employee record?")) {
        window.location.href = "employee_delete.jsp?id=" + id;
    }
    // else: do nothing (cancel delete)
}
	function updt(id){
		alert("Update id="+id);
		window.location.href="employee_update.jsp?id="+id;
	}
</script>

</head>
<body>
<h2 class="mb-4 text-center">Employee Details</h2>



<table class="table table-bordered table-hover shadow">
  <thead class="table-primary">
    <tr>
      <th >ID</th>
      <th >Employee Name</th>
      <th >Email</th>
      <th >Mobile No.</th>
      <th >Gender</th>
      <th >Date of Joining</th>
      <th >Status</th>
      <th>Department</th>
      <th>Designation</th>
      <th>Salary</th>
      <th>Action</th>
    </tr>
  </thead>
  <tbody>


<%
	
	Statement stmt;
	PreparedStatement pstmt;
	ResultSet rs;
	
	try{
	
		stmt=con.createStatement();
		rs=stmt.executeQuery("select * from employee_details");
		
		while(rs.next()){
			
			int id = rs.getInt("emp_id");
			String eenm = rs.getString("emp_name");
			String eemail = rs.getString("email");
			String emob = rs.getString("mobile");
			String egender = rs.getString("gender");
			Date edob_join = rs.getDate("dob_join");
			String estatus = rs.getString("status");
			String edepartment = rs.getString("department");
			String edesignation = rs.getString("designation");
			double esalary = rs.getDouble("salary");
			%>
	    	<tr>
	    		<td><%= id %></td>
	    		<td><%= eenm %></td>
	    		<td><%= eemail %></td>
	    		<td><%= emob %></td>
	    		<td><%= egender %></td>
	    		<td><%= edob_join %></td>
	    		<td><%= estatus %></td>
	    		<td><%= edepartment %></td>
	    		<td><%= edesignation %></td>
	    		<td><%= esalary %></td>
	    		<td><button type="button" onclick="del(<%= id %>)" class="btn btn-outline-danger">Delete</button>
	    		<button type="button" onclick="updt(<%= id %>)" class="btn btn-outline-warning">Update</button></td>
	    		
	    	</tr>
	    	<%
	    	   
		}
	}catch(Exception e){
		System.out.println("Error: "+e);
	}
%>
</body>
</html>