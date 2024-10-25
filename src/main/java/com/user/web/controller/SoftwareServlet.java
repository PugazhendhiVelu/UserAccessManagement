package com.user.web.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.user.web.util.Connect;


@WebServlet("/SoftwareServlet")
public class SoftwareServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("softwareName");
		String description = request.getParameter("description");
		String level = request.getParameter("level");
		Connection c = null;
        PreparedStatement p = null;
        ResultSet rs = null;
        String sql = "SELECT name FROM software WHERE name=?";
        String add = "insert into software (name , description , access_levels ) values(?,?,?::options)";
        try {
            c = Connect.getConnection();
            p = c.prepareStatement(sql);
            p.setString(1, name);
            rs = p.executeQuery();

            if (!rs.next()) {
            	p = c.prepareStatement(add);
                p.setString(1, name);
                p.setString(2, description);
                p.setString(3, level);
                p.executeUpdate();
                
                response.sendRedirect("createSoftware.jsp");
            } else {
                response.sendRedirect("createSoftware.jsp?error=Software already existed");
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
