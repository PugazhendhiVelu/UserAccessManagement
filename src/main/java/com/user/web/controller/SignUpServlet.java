package com.user.web.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.user.web.util.Connect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/registerServlet")
public class SignUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username").strip();
		String password = request.getParameter("password").strip();
		String role = "Employee";
		
		Connection c = null;
        PreparedStatement p = null;
        ResultSet rs = null;
        String sql = "SELECT username FROM users WHERE username=?";
        String add = "insert into users (username , password , role ) values(?,?,?::user_role)";
        try {
            c = Connect.getConnection();
            p = c.prepareStatement(sql);
            p.setString(1, username);
            rs = p.executeQuery();

            if (!rs.next()) {
            	p = c.prepareStatement(add);
                p.setString(1, username);
                p.setString(2, password);
                p.setString(3, role);
                p.executeUpdate();
                response.sendRedirect("login.jsp");	
                
            } else {
                response.sendRedirect("signup.jsp?error=Username already existed");
            }


        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            throw new ServletException("Database access error", e);
        } finally {
            try {
                if (rs != null) rs.close();
                if (p != null) p.close();
                if (c != null) c.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
		
		
	}

}
