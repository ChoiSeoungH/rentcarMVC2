package com.basic.rentcar.controller.user;

import _04_rentcar.MemberVO;
import com.basic.rentcar.dao.UserDao;
import com.basic.rentcar.fronController.Controller;
import com.basic.rentcar.vo.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class UpdateUserController implements Controller {
  @Override
  public String requestHandler(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    int no=Integer.parseInt(request.getParameter("no"));

    String email=request.getParameter("email");
    String tel=request.getParameter("tel");
    String hobby=request.getParameter("hobby");
    String job=request.getParameter("job");
    String age=request.getParameter("age");
    String info=request.getParameter("info");

    String ctx=request.getContextPath();
    int cnt= UserDao.getInstance().updateUser(email,tel,hobby,job,age,info,no);
    if(cnt>0) {
      return "redirect:"+ctx+"/userInfo.do";
    }else {
      throw new ServletException("not update");
    }

  }
}

