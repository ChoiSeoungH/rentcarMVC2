package com.basic.rentcar.dao;


import com.basic.rentcar.vo.Rentcar;
import com.basic.rentcar.vo.joinCarView;
import com.basic.rentcar.vo.Reservation;

import java.sql.*;
import java.util.ArrayList;

import static com.basic.rentcar.util.MyBatisConfig.dbclose;
import static com.basic.rentcar.util.MyBatisConfig.getConnection;

public class RentcarDao {
  private RentcarDao() {
  }

  private static RentcarDao dao = new RentcarDao();

  public static RentcarDao getInstance() {
    return dao;
  }

  Connection conn = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;
  public ArrayList<Rentcar> getSelectCar() {

    ArrayList<Rentcar> v = new ArrayList<Rentcar>();

    try {

      conn = getConnection();

      String sql = "SELECT * FROM rentcar ORDER BY no DESC";
      // String sql = "SELECT * FROM rentcar ORDER BY no DESC LIMIT 3";
      pstmt = conn.prepareStatement(sql);

      rs = pstmt.executeQuery();
      int count = 0;
      while (rs.next()) {

        Rentcar bean = new Rentcar();
        bean.setNo(rs.getInt("no"));
        bean.setName(rs.getString("name"));
        bean.setCategory(rs.getInt("category"));
        bean.setPrice(rs.getInt("price"));
        bean.setUsepeople(rs.getInt("usepeople"));
        bean.setTotalQty(rs.getInt("total_qty"));
        bean.setCompany(rs.getString("company"));
        bean.setImg(rs.getString("img"));
        bean.setInfo(rs.getString("info"));

        v.add(bean);
        count++;

        if (count > 2)
          break;
      }
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      dbclose(conn,pstmt,rs);
    }

    return v;
  }


  public Rentcar getOneCar(int no) {

    Rentcar bean = new Rentcar();
    conn = getConnection();

    try {

      String sql = "SELECT * FROM rentcar WHERE no=?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, no);

      rs = pstmt.executeQuery();
      if (rs.next()) {
        System.out.println("no=" + no );
        System.out.println("total qty=" + rs.getInt("total_qty"));
        bean.setNo(no);
        bean.setName(rs.getString("name"));
        bean.setCategory(rs.getInt("category"));
        bean.setPrice(rs.getInt("price"));
        bean.setUsepeople(rs.getInt("usepeople"));
        bean.setTotalQty(rs.getInt("total_qty"));
        bean.setCompany(rs.getString("company"));
        bean.setImg(rs.getString("img"));
        bean.setInfo(rs.getString("info"));
      }
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      dbclose(conn,pstmt,rs);
    }
    return bean;
  }


  public void setReserveCar(Reservation bean) {

    conn = getConnection();
    int num = 0;
    try {

      String sql = "INSERT INTO carreserve ( no, id, qty, dday, rday, "
          + "usein, usewifi, usenavi, useseat)" + " VALUES( ?,?,?,?,?,?,?,?,?)";
      pstmt = conn.prepareStatement(sql);

      pstmt.setInt(1, bean.getNo());
      pstmt.setString(2, bean.getId());
      pstmt.setInt(3, bean.getQty());
      pstmt.setInt(4, bean.getDday());
      pstmt.setString(5, bean.getRday());
      pstmt.setInt(6, bean.getUsein());
      pstmt.setInt(7, bean.getUsewifi());
      pstmt.setInt(8, bean.getUsenavi());
      pstmt.setInt(9, bean.getUseseat());

      if(pstmt.executeUpdate() > 0) {
        updateRentcarQty(bean.getNo() ,bean.getQty());
        System.out.println("차량 예약 완료");
      }



    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      dbclose(conn,pstmt,rs);
    }
  }

  private void updateRentcarQty(int no , int rentQty) {
    conn = getConnection();

    try {
      String sql = "update rentcar set total_qty =total_qty - ? where no = ?";
      pstmt = conn.prepareStatement(sql);

      pstmt.setInt(1, rentQty);
      pstmt.setInt(2, no);

      pstmt.executeUpdate();

      System.out.println("수량 업데이트 완료");

    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      dbclose(conn,pstmt,rs);
    }
  }
  public ArrayList<Rentcar> getAllCar() {
    ArrayList<Rentcar> v = new ArrayList<>();

    Rentcar bean = null;

    conn = getConnection();
    try {
      String sql = "SELECT * FROM rentcar";
      pstmt = conn.prepareStatement(sql);

      rs = pstmt.executeQuery();

      while (rs.next()) {

        bean = new Rentcar();
        bean.setNo(rs.getInt("no"));
        bean.setName(rs.getString("name"));
        bean.setCategory(rs.getInt("category"));
        bean.setPrice(rs.getInt("price"));
        bean.setUsepeople(rs.getInt("usepeople"));
        bean.setTotalQty(rs.getInt("total_qty"));
        bean.setCompany(rs.getString("company"));
        bean.setImg(rs.getString("img"));
        bean.setInfo(rs.getString("info"));

        v.add(bean);
      }
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      dbclose(conn,pstmt,rs);
    }
    return v;

  }


  public ArrayList<Rentcar> getCategoryCar(int cate) {

    ArrayList<Rentcar> v = new ArrayList<>();

    Rentcar bean = null;

    conn = getConnection();
    try {
      String sql = "SELECT * FROM rentcar WHERE category=?";
      pstmt = conn.prepareStatement(sql);

      pstmt.setInt(1, cate);

      rs = pstmt.executeQuery();

      while (rs.next()) {

        bean = new Rentcar();
        bean.setNo(rs.getInt("no"));
        bean.setName(rs.getString("name"));
        bean.setCategory(rs.getInt("category"));
        bean.setPrice(rs.getInt("price"));
        bean.setUsepeople(rs.getInt("usepeople"));
        bean.setTotalQty(rs.getInt("total_qty"));
        bean.setCompany(rs.getString("company"));
        bean.setImg(rs.getString("img"));
        bean.setInfo(rs.getString("info"));

        v.add(bean);
      }
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      dbclose(conn,pstmt,rs);
    }
    return v;
  }


  // 삭제하면 다시 토탈 car 다시 업데이트 되야함



  public int insertCar(Rentcar vo) {
    String SQL="insert into rentcar(name, category, price, usepeople, total_qty,company, img,info) values(?,?,?,?,?,?,?,?)";
    conn = getConnection();
    System.out.println("vo : "+ vo);
    int cnt=-1;
    try {
      pstmt=conn.prepareStatement(SQL);
      pstmt.setString(1, vo.getName());
      pstmt.setInt(2, vo.getCategory());
      pstmt.setInt(3, vo.getPrice());
      pstmt.setInt(4, vo.getUsepeople());
      pstmt.setInt(5, vo.getTotalQty());
      pstmt.setString(6, vo.getCompany());
      pstmt.setString(7, vo.getImg());
      pstmt.setString(8, vo.getInfo());
      cnt=pstmt.executeUpdate();
      System.out.println(cnt);
    }catch (Exception e) {
      e.printStackTrace();
    }finally {
      dbclose(conn,pstmt,rs);
    }
    return cnt;
  }

  public String getNextNo() {
    conn = getConnection();

    try {
      String sql = "SELECT * FROM rentcar ORDER BY no DESC LIMIT 1";
      pstmt = conn.prepareStatement(sql);
      rs = pstmt.executeQuery();
      if (rs.next()) {
        return rs.getInt("no")+1+"";
      }
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      dbclose(conn,pstmt,rs);
    }
    return "";
  }
}
