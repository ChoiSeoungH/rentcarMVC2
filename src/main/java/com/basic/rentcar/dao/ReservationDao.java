package com.basic.rentcar.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ReservationDao {
  private ReservationDao() {
  }

  private static ReservationDao dao = new ReservationDao();

  public static ReservationDao getInstance() {
    return dao;
  }

  Connection conn = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;
}
