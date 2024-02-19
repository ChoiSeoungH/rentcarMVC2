package com.basic.rentcar.controller.rentcar;


import com.basic.rentcar.dao.RentcarDao;
import com.basic.rentcar.fronController.Controller;
import com.basic.rentcar.vo.Rentcar;
import com.basic.rentcar.vo.Reservation;
import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.Data;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class ReservateCarController implements Controller {
  @Override
  public String requestHandler(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    RentcarDao rdao = RentcarDao.getInstance();
    HttpSession session = request.getSession();
    String id = (String)session.getAttribute("id");
    int no = Integer.parseInt(request.getParameter("no"));

    Reservation rbean = new Reservation();
    rbean.setNo(no);
    rbean.setId(id);
    rbean.setQty(Integer.parseInt(request.getParameter("qty")));
    rbean.setDday(Integer.parseInt(request.getParameter("dday")));
    rbean.setRday(request.getParameter("rday"));
    rbean.setUsein(Integer.parseInt(request.getParameter("usein")));
    rbean.setUsewifi(Integer.parseInt(request.getParameter("usewifi")));
    rbean.setUsenavi(Integer.parseInt(request.getParameter("usenavi")));
    rbean.setUseseat(Integer.parseInt(request.getParameter("useseat")));

    Date d1 = new Date();
    Date d2 = new Date();

    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    try {
      d1 = sdf.parse(rbean.getRday());
      d2 = sdf.parse(sdf.format(d2));		// format() 메서느는 SimpleDateFormat과 같은 역할(yyyy-MM-dd)
    } catch (ParseException e) {
      throw new RuntimeException(e);
    }

    int compare = d1.compareTo(d2);
    System.out.println(compare);
    if (compare<0) {
      return null;
    }

    String id1 = (String)session.getAttribute("id");

    rdao.setReserveCar(rbean);

    Rentcar cbean = rdao.getOneCar(rbean.getNo());

    int totalCar = cbean.getPrice() * rbean.getQty() * rbean.getDday();

    int usein = 0;
    if(rbean.getUsein() == 1){ usein = 10000; }
    int usewifi = 0;
    if(rbean.getUsewifi() == 1){ usewifi = 10000; }
    int useseat = 0;
    if(rbean.getUseseat() == 1){ useseat = 10000; }
    int totalOption = (rbean.getQty() * rbean.getDday() * (usein + usewifi + useseat));

    request.setAttribute("cbean",cbean);
    request.setAttribute("totalCar",totalCar);
    request.setAttribute("totalOption",totalOption);
    request.setAttribute("compare",compare);


    ReservationResult result = new ReservationResult(); // ReservationResult 객체 생성

    result.setTotalCar(totalCar); // ReservationResult 객체에 총 자동차 수 설정
    result.setTotalOption(totalOption); // ReservationResult 객체에 총 옵션 수 설정
    result.setTotalAmount(totalCar + totalOption); // 총 금액 계산하여 ReservationResult 객체에 설정

    response.getWriter().write(new Gson().toJson(result)); // ReservationResult 객체를 JSON으로 변환하여 응답에 기록

    return null;
  }
  @Data
   class ReservationResult {
    private int totalCar;
    private int totalOption;
    private int totalAmount;
  }
}
