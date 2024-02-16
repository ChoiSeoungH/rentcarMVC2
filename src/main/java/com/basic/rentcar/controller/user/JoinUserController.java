package com.basic.rentcar.controller.user;

import com.basic.rentcar.dao.UserDao;
import com.basic.rentcar.fronController.Controller;
import com.basic.rentcar.vo.User;
import com.mysql.cj.Session;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

public class JoinUserController implements Controller {
  @Override
  public String requestHandler(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String id=request.getParameter("loginId");
    String pw=request.getParameter("loginPw");
    String email=request.getParameter("email");
    String tel=request.getParameter("tel");
    String hobby=request.getParameter("hobby");
    String job=request.getParameter("job");
    String age=request.getParameter("age");
    String info=request.getParameter("info");

    User vo=new User();
    vo.setId(id);
    vo.setPw(pw);
    vo.setEmail(email);
    vo.setTel(tel);
    vo.setHobby(hobby);
    vo.setJob(job);
    vo.setAge(age);
    vo.setInfo(info);

    int cnt= UserDao.getInstance().Joinmember(vo);
    if(cnt>0) {
      String ctx = request.getContextPath();
      HttpSession session = request.getSession();
      session.setAttribute("id",id);
      return "redirect:"+ctx+"/main.do";
    }else {
      throw new ServletException("not insert");
    }
  }
}
