package com.basic.rentcar.controller.user;

import com.basic.rentcar.dao.UserDao;
import com.basic.rentcar.fronController.Controller;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class DeleteUserController implements Controller {
  @Override
  public String requestHandler(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    String ctx=request.getContextPath();
    System.out.println(request.getParameter("no"));
    int cnt= UserDao.getInstance().deleteUser(Integer.parseInt(request.getParameter("no")));
    response.getWriter().print(cnt);
    return null;
  }
}

