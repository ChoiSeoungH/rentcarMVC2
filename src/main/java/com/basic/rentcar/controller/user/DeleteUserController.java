package com.basic.rentcar.controller.user;

import com.basic.rentcar.dao.UserDao;
import com.basic.rentcar.fronController.Controller;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

public class DeleteUserController implements Controller {
  @Override
  public String requestHandler(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    String ctx=request.getContextPath();
    System.out.println(request.getParameter("no"));
    HttpSession session = request.getSession();
    int cnt= UserDao.getInstance().deleteUser(Integer.parseInt(request.getParameter("no")));
    if (cnt!=-1) {
      session.removeAttribute("id");
    }
    response.getWriter().print(cnt);
    return null;
  }
}

