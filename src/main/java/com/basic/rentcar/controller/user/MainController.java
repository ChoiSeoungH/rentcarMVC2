package com.basic.rentcar.controller.user;

import com.basic.rentcar.fronController.Controller;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class MainController implements Controller {
  @Override
  public String requestHandler(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String center = request.getParameter("center");
    String ctx = request.getContextPath();
    request.setAttribute("center", center);
    request.setAttribute("ctx", ctx);
    return "main";
  }
}
