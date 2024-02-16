package com.basic.rentcar.controller.rentcar;

import com.basic.rentcar.dao.RentcarDao;
import com.basic.rentcar.fronController.Controller;
import com.basic.rentcar.vo.Rentcar;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;

public class CarMainController implements Controller {
  @Override
  public String requestHandler(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // 데이터베이스에 연결하여, 최신순 자동차 3대만뿌려주는 데이터를 가져옴
    RentcarDao rdao = RentcarDao.getInstance();
    ArrayList<Rentcar> list = rdao.getSelectCar();
    HttpSession session = request.getSession();
    session.setAttribute("list", list);
    String center = "rentcar/carMain.jsp";
    request.setAttribute("center", center);
    return "main";
  }
}
