package com.basic.rentcar.controller.rentcar;

import _04_rentcar.RentcarVO;
import com.basic.rentcar.dao.RentcarDao;
import com.basic.rentcar.fronController.Controller;
import com.basic.rentcar.vo.Rentcar;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class CarInfoController implements Controller {
  @Override
  public String requestHandler(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    int no = Integer.parseInt(request.getParameter("no"));

    // 데이터베이스에 접근
    RentcarDao rdao = RentcarDao.getInstance();

    // 렌트카 하나에 대한 정보를 얻어옴
    Rentcar bean = rdao.getOneCar(no);
    request.setAttribute("bean", bean);
    String center = request.getParameter("center");
    request.setAttribute("center", center);

    int category = bean.getCategory();
    String temp = "";
    if (category == 1)
      temp = "소형";
    else if (category == 2)
      temp = "중형";
    else if (category == 3)
      temp = "대형";

    request.setAttribute("temp", temp);
    return "main";
  }
}
