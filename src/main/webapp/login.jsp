<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<!DOCTYPE html>
<html>
<head>
<title>User Access Management</title>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="styles/nav.css">
<link rel="stylesheet" href="styles/login.css">
</head>
<body>
	<nav class="nav-main">
		<h1>User Access Management</h1>
	</nav>

	<main class="login-main">
		<form action="loginServlet" method="post" class="login-form">
			<div class="login-container">
				<h2>Welcome back</h2>
				<%
				String errorMessage = request.getParameter("error");
				if (errorMessage != null) {
				%>
				<div style="color: red; text-align: center">
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
				<input type="submit" value="Login"> <label>Don't
					have account then <a href="signup.jsp">Register</a>
				</label>
			</div>
		</form>
	</main>

	<footer>
		<h2>Created by Pugazhendhi</h2>
	</footer>
</body>
</html>
