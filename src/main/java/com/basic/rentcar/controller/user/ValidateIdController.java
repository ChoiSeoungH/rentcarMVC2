package com.basic.rentcar.controller.user;

import com.basic.rentcar.dao.UserDao;
import com.basic.rentcar.fronController.Controller;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.validation.Valid;

import java.io.IOException;

public class ValidateIdController implements Controller {
  @Override
  public String requestHandler(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String id=request.getParameter("id");
    String pw=request.getParameter("pw");
    System.out.println(request.getParameter("id"));
    System.out.println(request.getParameter("pw"));
    String passData;
    if (pw==null) {
      passData = UserDao.getInstance().isValidId(id)?   "notValid":"valid";
      System.out.println(passData);
    }else{
      passData = UserDao.getInstance().isValidId(id,pw)? "valid":"notValid";
      System.out.println(passData);
    }

    response.getWriter().print(passData);
    return null;
  }
}