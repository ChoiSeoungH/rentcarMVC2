package com.basic.rentcar.controller.rentcar;

import com.basic.rentcar.dao.RentcarDao;
import com.basic.rentcar.dao.ReservationDao;
import com.basic.rentcar.fronController.Controller;
import com.basic.rentcar.vo.Reservation;
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
    ReservationDao dao = ReservationDao.getInstance();
    ArrayList<joinCarView> reserveList = dao.getAllReserve((String) session.getAttribute("id"));
    request.setAttribute("reserveList",reserveList);
    String center = "rentcar/userReserveList.jsp";
    request.setAttribute("center", center);
    return "main";
  }
}
