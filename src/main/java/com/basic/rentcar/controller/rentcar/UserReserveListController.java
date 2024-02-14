package com.basic.rentcar.controller.rentcar;

import com.basic.rentcar.dao.RentcarDao;
import com.basic.rentcar.fronController.Controller;
import com.basic.rentcar.vo.joinCarView;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;

public class UserReserveListController implements Controller {
  @Override
  public String requestHandler(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    HttpSession session = request.getSession();
    RentcarDao rdao = RentcarDao.getInstance();
    ArrayList<joinCarView> reserveList = rdao.getAllReserve((String) session.getAttribute("id"));
    request.setAttribute("reserveList",reserveList);
    String center = request.getParameter("center");
    request.setAttribute("center", center);
    return "main";
  }
}
