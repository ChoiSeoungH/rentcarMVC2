package com.basic.rentcar.controller.rentcar;

import com.basic.rentcar.dao.RentcarDao;
import com.basic.rentcar.fronController.Controller;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class DeleteResController implements Controller {
  @Override
  public String requestHandler(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    int resSeq = Integer.parseInt(request.getParameter("resSeq"));
    int qty = Integer.parseInt(request.getParameter("qty"));
    int no = Integer.parseInt(request.getParameter("no"));
    RentcarDao rdao = RentcarDao.getInstance();
    // 예약삭제 메소드 호출
    rdao.carRemoveReserve(resSeq,qty,no);
    String ctx = request.getContextPath();
    return "redirect:"+ctx+"/userReserveList.do";
  }
}
