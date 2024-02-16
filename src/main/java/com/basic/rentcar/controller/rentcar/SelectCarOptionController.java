package com.basic.rentcar.controller.rentcar;

import com.basic.rentcar.fronController.Controller;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class SelectCarOptionController implements Controller {
  @Override
  public String requestHandler(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    int no = Integer.parseInt(request.getParameter("no"));
    // 수량
    int qty = Integer.parseInt(request.getParameter("qty"));
    // 이미지
    String img = request.getParameter("img");


    request.setAttribute("no", no);
    request.setAttribute("qty", qty);
    request.setAttribute("img", img);
    String center = "rentcar/carOption.jsp";
    request.setAttribute("center", center);
    return "main";
  }
}
