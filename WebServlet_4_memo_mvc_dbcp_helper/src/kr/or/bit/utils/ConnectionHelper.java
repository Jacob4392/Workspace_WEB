package kr.or.bit.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ConnectionHelper {
	public static Connection getConnection(String dbname) {

		if (dbname.toLowerCase().equals("oracle")) {
			try {
					Context initContext = new InitialContext();
					DataSource source = (DataSource) initContext.lookup("java:comp/env/jdbc/oracle");
					Connection conn = source.getConnection();
					return conn;
			} catch (Exception ex) {
				System.out.println("connection" + ex.getMessage());
				return null;
			}
		} else if (dbname.toLowerCase().equals("mysql")) {
			try {
				// 1.
				Class.forName("com.mysql.jdbc.Driver");
				Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/demoweb", "devadmin",
						"mysql");

				// 2.
				/*
				 * Context initContext = new InitialContext(); Context context =
				 * (Context)initContext.lookup("java:/comp/env"); DataSource source =
				 * (DataSource)context.lookup("mysql/demoweb"); Connection conn =
				 * source.getConnection();
				 */
				return conn;
			} catch (Exception ex) {
				return null;
			}
		} else {
			return null;
		}

	}

	public static void close(Connection conn) {
		if (conn != null) {
			try {
				conn.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
	}

	public static void close(Statement stmt) {
		if (stmt != null) {
			try {
				stmt.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
	}

	public static void close(ResultSet rs) {
		if (rs != null) {
			try {
				rs.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
	}

	public static void close(PreparedStatement pstmt) {
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
	}
}
