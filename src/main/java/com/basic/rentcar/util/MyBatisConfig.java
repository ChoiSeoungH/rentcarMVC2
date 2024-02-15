package com.basic.rentcar.util;

import java.sql.*;

public class MyBatisConfig {

  public static Connection getConnection() {
    Connection conn = null;
    String dbURL = "jdbc:mysql://localhost:3306/rentcardb01?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false&allowPublicKeyRetrieval=true";
    String dbID = "root";
    String dbPassword = "1234";
    try {
      Class.forName("com.mysql.cj.jdbc.Driver");
      conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
    } catch (Exception e) {
      e.printStackTrace();
    }
    return conn;
  }

  public static void dbclose(Connection conn, PreparedStatement pstmt, ResultSet rs) {
    if (rs != null) {
      try {
        rs.close();
      } catch (SQLException e) {
      }
    }
    if (pstmt != null) {
      try {
        pstmt.close();
      } catch (SQLException e) {
      }
    }
    if (conn != null) {
      try {
        conn.close();
      } catch (SQLException e) {
      }
    }
  }
}
