package com.basic.rentcar.controller.rentcar;


import com.basic.rentcar.dao.RentcarDao;
import com.basic.rentcar.fronController.Controller;
import com.basic.rentcar.vo.Rentcar;
import com.basic.rentcar.vo.Reservation;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

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



    // 날짜 비교
    Date d1 = new Date();
    Date d2 = new Date();

    //
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    try {
      d1 = sdf.parse(rbean.getRday());
      d2 = sdf.parse(sdf.format(d2));		// format() 메서느는 SimpleDateFormat과 같은 역할(yyyy-MM-dd)
    } catch (ParseException e) {
      throw new RuntimeException(e);
    }

    // 날짜비교 메서드 사용
    int compare = d1.compareTo(d2);
    // 예약하려는 날짜가 현재 날짜보다 이전이라면 -1
    // 예약하려는 날짜와 현재 날짜가 같다면 0
    // 예약하려는 날짜가 현재 날짜보다 이후라면 1을 리턴
    // System.out.println(compare);

    // 결과적으로 아무런 문제가 없다면 데이터 저장 후 결과 페이지 보여주기
    // 아이디 값이 빈 클래스에 없기에
    String id1 = (String)session.getAttribute("id");

    // 데이터 베이스에 빈 클래스 저장
    rdao.setReserveCar(rbean);

    // 차량 정보 얻어오기
    Rentcar cbean = rdao.getOneCar(rbean.getNo());

    // 차량 총 금액
    int totalCar = cbean.getPrice() * rbean.getQty() * rbean.getDday();

    // 옵션 금액
    int usein = 0;
    // 선택 시(1), 10,000원 추가
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

    String center = "rentcar/reserveCarView.jsp";
    request.setAttribute("center", center);
    return "main";
  }
}
