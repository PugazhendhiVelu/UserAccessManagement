<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Registration</title>
<link rel="stylesheet" href="styles/nav.css">
<link rel="stylesheet" href="styles/signup.css">
</head>
<body>
	<nav class="nav-main">
		<h1>User Access Management</h1>
	</nav>

	<main class="register-main">
		<form action="registerServlet" method="post" class="register-form">
			<div class="register-container">
				<h2>Hello !!</h2>
				<%
				String errorMessage = request.getParameter("error");
				if (errorMessage != null) {
				%>
				<div style="color: red; text-align: center;">
					<%=errorMessage%>
				</div>
				<%
				}
				%>
				<div>
					<label for="username">Enter your UserName:</label> <input
						type="text" id="username" name="username" required>
				</div>
				<div>
					<label for="password">Enter your Password:</label> <input
						type="password" id="password" name="password" required>
				</div>
				<!-- 
					<div>
					<label for="role">Choose your role:</label> <input type="radio"
						id="role_employee" name="role" value="Employee" checked> <label
						for="role_employee">Employee</label> <input type="radio"
						id="role_manager" name="role" value="Manager"> <label
						for="role_manager">Manager</label> <input type="radio"
						id="role_admin" name="role" value="Admin"> <label
						for="role_admin">Admin</label>
				</div>
					
				 -->

				<input type="submit" value="Register"> <label>Already
					have account then <a href="login.jsp">Login</a>
				</label>
			</div>
		</form>
	</main>

	<footer>
		<h2>Created by Pugazhendhi</h2>
	</footer>

</body>
</html>