package com.user.web.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.user.web.util.Connect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/RequestServlet")
public class RequestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int uid =Integer.parseInt(request.getParameter("userId")) ;
		int sid =Integer.parseInt(request.getParameter("softwareId")) ;
		String reason = request.getParameter("reason");
		String level = request.getParameter("level");
		Connection c = null;
        PreparedStatement p = null;
        String add = "insert into requests (user_id , software_id , access_type,reason ) values(?,?,?,?)";
        try {
            c = Connect.getConnection();
            p = c.prepareStatement(add);
            p.setInt(1, uid);
            p.setInt(2, sid);
            p.setString(3, level);
            p.setString(4, reason);
            p.executeUpdate();
            
            response.sendRedirect("requestAccess.jsp");
            
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            throw new ServletException("Database access error", e);
        } finally {
            try {
                if (p != null) p.close();
                if (c != null) c.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
	}

}
