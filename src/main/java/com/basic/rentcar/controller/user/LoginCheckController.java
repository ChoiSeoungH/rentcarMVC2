package com.basic.rentcar.controller.user;

import com.basic.rentcar.dao.RentcarDao;
import com.basic.rentcar.fronController.Controller;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

public class LoginCheckController implements Controller {

  @Override
  public String requestHandler(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    String id = request.getParameter("id");
    String pw = request.getParameter("pw");
    int check = RentcarDao.getInstance().getMember(id, pw);
    System.out.println(check);
    if (check!=0) {
      HttpSession session = request.getSession();
      session.setAttribute("id", id);
    }
    response.getWriter().print(check);
    return null;
  }
}
