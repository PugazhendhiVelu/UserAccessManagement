<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.user.web.util.Connect"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manager</title>
<link rel="stylesheet" href="styles/manager.css">
<script type="text/javascript">
function handleLogout(){
	window.location.href = 'login.jsp';
	alert("Logged out succcessfully");
}
</script>
</head>

<body>
	<nav class="nav-main">
		<div>
			<h1> User Access Management </h1>
		</div>
		
		<div>
			<button onclick=handleLogout()>Logout</button>
		</div>
	</nav>
	<main class="manager-main">
	<%
		Integer userId = (Integer) session.getAttribute("userId");
		if(userId==null){
			response.sendRedirect("login.jsp");
			return;
		}
		String name = (String) session.getAttribute("name");
		
		%>
		
		<h1>Welcome <%= name %></h1>
		<div>
			<h2>Pending Requests List</h2>
			<table border="1">
				<%
				Connection c = null;
				PreparedStatement p = null;
				ResultSet rs = null;
				String sql = "SELECT r.id AS reqId, "
				           + "u.username AS employee_name, "
				           + "s.name AS software_name, "
				           + "r.access_type AS access_levels, "
				           + "r.reason AS reason "
				           + "FROM requests r "
				           + "JOIN users u ON r.user_id = u.id "
				           + "JOIN software s ON r.software_id = s.id "
				           + "WHERE r.status = 'Pending'";


				try {
					c = Connect.getConnection();
					p = c.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
					rs = p.executeQuery();
					boolean hasNext = rs.next();
					if(!hasNext){	
					%>
						<h1 style = "color:red ;text-align: center;">No Pending requests</h1>
					
					<%
					}
					else{
						
					%>
					<tr>
						<th>Employee Name</th>
						<th>Software Name</th>
						<th>Access Type</th>
						<th>Reason</th>
						<th>Approve</th>
						<th>Reject</th>
					<tr>
					<%
					int count=0;
					do {
						count++;
						int reqId = rs.getInt("reqId");
						String employeeName = rs.getString("employee_name");
						String softwareName = rs.getString("software_name");
						String reason = rs.getString("reason");
						String level = rs.getString("access_levels");
				%>
				<tr>
					<td><%=employeeName%></td>
					<td><%=softwareName%></td>
					<td><%=level%></td>
					<td><%=reason%></td>
					<td>
						<form action="ApprovalServlet" method="post">
							<input type="hidden" name="reqId" value="<%=reqId%>"> <input
								type="hidden" name="action" value="Approved">
							<button type="submit">Approve</button>
						</form>
					</td>
					<td>
						<form action="ApprovalServlet" method="post">
							<input type="hidden" name="reqId" value="<%=reqId%>"> <input
								type="hidden" name="action" value="Rejected">
							<button type="submit">Reject</button>
						</form>
					</td>
				</tr>
				<%
				}
				while (rs.next());}
					
				} catch (SQLException e) {
				e.printStackTrace();
				} catch (ClassNotFoundException e) {
				e.printStackTrace();
				} finally { if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); } 
				if (p != null) try { p.close(); } catch (SQLException e) { e.printStackTrace(); } 
				if (c != null) try { c.close(); } catch (SQLException e) { e.printStackTrace(); } 
				}

				%>
			</table>


		</div>
	</main>

</body>
</html>