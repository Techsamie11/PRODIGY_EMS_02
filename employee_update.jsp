<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*"%>  
<%@ include file="DbConnection.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Employee Details</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

</head>
<body>
<%
	String updet_id = request.getParameter("id");
	//out.println(updet_id);
	Statement stmt;
	ResultSet rs;
	
	try{
		
		stmt=con.createStatement();
		rs=stmt.executeQuery("select * from employee_details where emp_id=" + updet_id);
		
		while(rs.next()){
			
			int id = rs.getInt("emp_id");
			String enm = rs.getString("emp_name");
			String email = rs.getString("email");
			String mob = rs.getString("mobile");
			//out.println(mob);
			String gender = rs.getString("gender");
			Date dob_join =  rs.getDate("dob_join");
			String status = rs.getString("status");
			String department = rs.getString("department");
			String designation = rs.getString("designation");
			double salary = rs.getDouble("salary");
			%>
			<form action="employee_newupdate.jsp" method="get">
			    <div class="modal-body">
			    <div class="mb-3">
		  			<label for="exampleFormControlInput1" class="form-label">Employee ID</label>
		  			<input type="text" readonly="readonly" class="form-control" value="<%=id %>" name="ID" placeholder="Enter Admin ID">
				</div>
				<div class="mb-3">
		  			<label for="exampleFormControlInput1" class="form-label">Enter Employee Name:</label>
		  			<input type="text" class="form-control" value="<%=enm %>" name="enm" placeholder="Enter Student Name">
				</div>
				<div class="mb-3">
		  			<label for="exampleFormControlInput1" class="form-label">Enter Email</label>
		  			<input type="email" class="form-control" value="<%=email %>" name="email" placeholder="Enter Email ">
				</div>
				<div class="mb-3">
		  			<label for="exampleFormControlInput1" class="form-label">Enter Mob No</label>
		  			<input type="number" class="form-control" value="<%=mob %>" name="mob" placeholder="Enter Mobile No ">
				</div>
				<div class="mb-3">
				    <label class="form-label">Employee Gender</label>
				    <select class="form-select" name="gender">
				        <option value="">-- Select Gender --</option>
				        <option value="Male" <%= "Male".equals(gender) ? "selected" : "" %>>Male</option>
				        <option value="Female" <%= "Female".equals(gender) ? "selected" : "" %>>Female</option>
				        <option value="Other" <%= "Other".equals(gender) ? "selected" : "" %>>Other</option>
				    </select>
				</div>
				<div class="mb-3">
                    <label class="form-label">Date of Joining</label>
                    <input type="date" value="<%= dob_join %>" name="date_of_joining" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Status</label>
                    <select name="status" class="form-select" >
                        <option value="Active" <%= "Active".equals(status) ? "selected" : "" %>>Active</option>
                        <option value="Inactive" <%= "Inactive".equals(status) ? "selected" : "" %>>Inactive</option>
                    </select>
                </div>
				<div class="mb-3">
		  			<label for="exampleFormControlInput1" class="form-label">Enter Employeee Department:</label>
		  			<input type="text" class="form-control" value="<%=department %>" name="department" placeholder="Enter Employeee Department:">
				</div>
				<div class="mb-3">
		  			<label for="exampleFormControlInput1" class="form-label">Enter Employee Designation</label>
		  			<input type="text" class="form-control" value="<%=designation %>" name="designation" placeholder="Enter Employee Designation">
				</div>
				<div class="mb-3">
		  			<label for="exampleFormControlInput1" class="form-label">Enter Employee Salary</label>
		  			<input type="text" class="form-control" value="<%=salary %>" name="salary" placeholder="Enter Employee Salary">
				</div>
				
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
		        <button type="Submit" class="btn btn-primary">Add Employee</button>
		      </div>
	     </form>
       <%
		}
		
	}catch(Exception e){
		System.out.println("Error:"+e);
	}
%>
</body>
</html>