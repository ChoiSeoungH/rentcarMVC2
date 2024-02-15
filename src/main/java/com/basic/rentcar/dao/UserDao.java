package com.basic.rentcar.dao;

import _04_rentcar.MemberVO;
import com.basic.rentcar.vo.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import static com.basic.rentcar.util.MyBatisConfig.dbclose;
import static com.basic.rentcar.util.MyBatisConfig.getConnection;

public class UserDao {
  private UserDao() {
  }

  private static UserDao dao = new UserDao();

  public static UserDao getInstance() {
    return dao;
  }

  Connection conn = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;
  static int no;
  public int getMember(String id, String pw) {

    System.out.println("id= " + id + " pw=" + pw);
    int result = 0;

    conn = getConnection();
    try {

      String sql = "SELECT * FROM member WHERE id=? and pw=?";
      pstmt = conn.prepareStatement(sql);

      pstmt.setString(1, id);
      pstmt.setString(2, pw);

      rs = pstmt.executeQuery();

      if (rs.next()) {
        result = 1;
      }

    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      dbclose(conn,pstmt,rs);
    }
    return result;
  }

  public int Joinmember(User vo) {
    String SQL="insert into member(id, pw, email, tel, hobby,job, age,info) values(?,?,?,?,?,?,?,?)";
    conn = getConnection();
    System.out.println("vo : "+ vo);
    int cnt=-1;
    try {
      pstmt=conn.prepareStatement(SQL);
      pstmt.setString(1, vo.getId());
      pstmt.setString(2, vo.getPw());
      pstmt.setString(3, vo.getEmail());
      pstmt.setString(4, vo.getTel());
      pstmt.setString(5, vo.getHobby());
      pstmt.setString(6, vo.getJob());
      pstmt.setString(7, vo.getAge());
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

  public User userInfo(String validId) {
    String SQL="select * from member where id=?";
    conn = getConnection();
    User vo=null;
    try {
      pstmt=conn.prepareStatement(SQL);
      pstmt.setString(1,validId);
      rs=pstmt.executeQuery();
      if(rs.next()) {
        int no = rs.getInt("no");
        String id = rs.getString("id");
        String pw = rs.getString("pw");
        String email = rs.getString("email");
        String tel = rs.getString("tel");
        String hobby = rs.getString("hobby");
        String job = rs.getString("job");
        String age = rs.getString("age");
        String info = rs.getString("info");

        vo=new User(no, id, pw, email, tel, hobby,job, age,info);
      }
    } catch (Exception e) {
      e.printStackTrace();
    }finally {
      dbclose(conn,pstmt,rs);
    }
    return vo;
  }

  public int updateUser(String email, String tel, String hobby, String job, String age, String info, int no) {
    String SQL="update member set email=?, tel=?,hobby=?, job=?,age=?, info=? where no=?";
    conn = getConnection();
    int cnt=-1;
    try {
      pstmt=conn.prepareStatement(SQL);
      pstmt.setString(1, email);
      pstmt.setString(2, tel);
      pstmt.setString(3, hobby);
      pstmt.setString(4, job);
      pstmt.setString(5, age);
      pstmt.setString(6, info);
      pstmt.setInt(7, no);
      cnt=pstmt.executeUpdate();
    } catch (Exception e) {
      e.printStackTrace();
    }finally {
      dbclose(conn,pstmt,rs);
    }
    return cnt;
  }

  public int deleteUser(int no) {
    String SQL="delete from member where no=?";
    conn = getConnection();
    int cnt=-1;
    try {
      pstmt=conn.prepareStatement(SQL);
      pstmt.setInt(1,no);
      cnt=pstmt.executeUpdate();
    } catch (Exception e) {
      e.printStackTrace();
    }finally {
      dbclose(conn,pstmt,rs);
    }
    return cnt;
  }

  public boolean isValidId(String id) {
    String SQL="select pass from member where id=?";
    conn = getConnection();
    try {
      pstmt=conn.prepareStatement(SQL);
      pstmt.setString(1, id);
      rs=pstmt.executeQuery();
      return rs.next();
    } catch (Exception e) {
      e.printStackTrace();
    }finally {
      dbclose(conn,pstmt,rs);
    }
    return false;
  }

  public boolean isValidId(String id, String pw) {
    String SQL="select pass from member where id=? AND pw=?";
    conn = getConnection();
    try {
      pstmt=conn.prepareStatement(SQL);
      pstmt.setString(1, id);
      pstmt.setString(2, pw);
      rs=pstmt.executeQuery();
      return rs.next();
    } catch (Exception e) {
      e.printStackTrace();
    }finally {
      dbclose(conn,pstmt,rs);
    }
    return false;
  }
}
