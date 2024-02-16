package com.basic.rentcar.dao;

import com.basic.rentcar.vo.joinCarView;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import static com.basic.rentcar.util.MyBatisConfig.dbclose;
import static com.basic.rentcar.util.MyBatisConfig.getConnection;

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

  public ArrayList<joinCarView> getAllReserve(String id) {

    ArrayList<joinCarView> v = new ArrayList<>();
    joinCarView bean = null;

    conn = getConnection();

    try {

      //select * from rentcar a2 ,carreserve a1  where a1.id = 'qwer' and curdate() < date_format(a1.rday , '%y-%m-%d') and a1.no = a2.no;
      // select * from rentcar a2 ,carreserve a1  where a1.id = 'qwer' and a1.no = a2.no;

      String sql = "select * from rentcar a2 ,carreserve a1  where a1.id = ? and a1.no = a2.no";
      System.out.println("id:"+id);
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, id);
      rs = pstmt.executeQuery();

      while (rs.next()) {
        bean = new joinCarView();
        bean.setNo(rs.getInt("no"));
        bean.setReserveSeq(rs.getInt("reserve_seq"));
        bean.setName(rs.getString("name"));
        bean.setPrice(rs.getInt("price"));
        bean.setImg(rs.getString("img"));
        bean.setQty(rs.getInt("qty"));
        bean.setDday(rs.getInt("dday"));
        bean.setRday(rs.getString("rday"));
        bean.setUsein(rs.getInt("usein"));
        bean.setUsewifi(rs.getInt("usewifi"));
        bean.setUsenavi(rs.getInt("usenavi"));
        bean.setUseseat(rs.getInt("useseat"));
        v.add(bean);
        System.out.println(bean);
      }
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      dbclose(conn,pstmt,rs);
    }

    return v;
  }

  public void carRemoveReserve(int reserveSeq ,int qty , int no) {

    conn = getConnection();
    try {
      String sql = "DELETE FROM carreserve where reserve_seq = ?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, reserveSeq);
      if(pstmt.executeUpdate()> 0 ) {
        backRentcarQty(no, qty);
        System.out.println("삭제 완료");
      }
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      dbclose(conn,pstmt,rs);
    }
  }
  private void backRentcarQty(int no , int rentQty) {
    conn = getConnection();

    try {
      String sql = "update rentcar set total_qty =total_qty + ? where no = ?";
      pstmt = conn.prepareStatement(sql);

      pstmt.setInt(1, rentQty);
      pstmt.setInt(2, no);

      pstmt.executeUpdate();

      System.out.println("rentQty= " + rentQty);

    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      dbclose(conn,pstmt,rs);
    }
  }
}
