<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.user.web.util.Connect"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Software Creation</title>
<link rel="stylesheet" href="styles/admin.css">
<script type="text/javascript">

function handleLogout() {
    window.location.href = 'login.jsp';
    alert("Logged out succcessfully");
}



</script>
</head>
<body>
	<nav class="nav-main">
		<div>
			<h1>User Access Management</h1>
		</div>
		<div>
			<button style="background-color: #ff4d4d;
    color: white;
    border: none;
    padding: 10px 15px;
    cursor: pointer;" onclick=handleLogout()>Logout</button>
		</div>
	</nav>

	<main class="admin-main">
	
	<%
		
		Integer userId = (Integer) session.getAttribute("userId");
		if(userId==null){
			response.sendRedirect("login.jsp");
			return;
		}
		String name = (String) session.getAttribute("name");
		%>
		
		<h1>Welcome <%= name %></h1>
		<div class="button-container">
			<button class="admin-create"
				onclick="document.getElementById('createForm').style.display='block';
                 document.getElementById('softwareList').style.display='none';">
				Create Software</button>
		</div>

		<div id="createForm" style="display: none;" class="admin-form">
			<form action="SoftwareServlet" method="post">
				<div>
					<%
					String errorMessage = request.getParameter("error");
					if (errorMessage != null) {
					%>
					<div style="color: red;">
						<%=errorMessage%>
					</div>
					<%
					}
					%>
					<div>
						<label for="softwareName">Enter your Software Name:</label> <input
							type="text" id="softwareName" name="softwareName" required>
					</div>
					<div>
						<label for="description">Description:</label>
						<textarea id="description" name="description" required></textarea>

					</div>
					<div>
						<label for="levels">Choose Access level:</label> <input
							type="radio" id="level_read" name="level" value="Read" checked>
						<label for="level_read">Read</label> <input type="radio"
							id="level_write" name="level" value="Write"> <label
							for="level_write">Write</label> <input type="radio"
							id="level_admin" name="level" value="Admin"> <label
							for="level_admin">Admin</label>
					</div>

					<input class="submit" type="submit" value="Create">

					<button
						onclick="document.getElementById('createForm').style.display='none';
						document.getElementById('softwareList').style.display='block';">back</button>
				</div>
			</form>
		</div>

		<div id="softwareList" class="admin-list">
			<h2>Software List</h2>
			<table border="1">
				<tr>
					<th>Software Name</th>
					<th>Description</th>
					<th>Access Level</th>
				</tr>
				<%
				Connection c = null;
				PreparedStatement p = null;
				ResultSet rs = null;
				String sql = "SELECT name , description , access_levels FROM software ";

				try {
					c = Connect.getConnection();
					p = c.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
					rs = p.executeQuery();
					while (rs.next()) {
						String softwareName = rs.getString("name");
						String description = rs.getString("description");
						String level = rs.getString("access_levels");
				%>
				<tr>
					<td><%=softwareName%></td>
					<td><%=description%></td>
					<td><%=level%></td>
				</tr>
				<%
				}
				} catch (SQLException e) {
				e.printStackTrace();
				} catch (ClassNotFoundException e) {
				e.printStackTrace();
				} finally {
				if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				if (p != null)
				try {
					p.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				if (c != null)
				try {
					c.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				}
				%>
			</table>


		</div>
	</main>
<footer>
		<h2 style="color:white;">Created by Pugazhendhi</h2>
	</footer>

</body>
</html>