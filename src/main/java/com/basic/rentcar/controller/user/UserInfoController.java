package com.basic.rentcar.controller.user;

import com.basic.rentcar.dao.UserDao;
import com.basic.rentcar.fronController.Controller;
import com.basic.rentcar.vo.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

public class UserInfoController implements Controller {
  @Override
  public String requestHandler(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String ctx = request.getContextPath();
    HttpSession session = request.getSession();
    String id;
    if(session.getAttribute("id")==null){
      return "redirect:"+ctx+"/main.do";
    }else{
      id = (String) session.getAttribute("id");
    }
    User vo= UserDao.getInstance().userInfo(id);
    request.setAttribute("vo", vo);

    String center = "user/userInfo.jsp";
    request.setAttribute("center", center);
    return "main";
  }
}
