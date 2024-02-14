package com.basic.rentcar.controller.rentcar;

import _04_rentcar.RentcarVO;
import com.basic.rentcar.dao.RentcarDao;
import com.basic.rentcar.fronController.Controller;
import com.basic.rentcar.vo.Rentcar;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;

public class CarListController implements Controller {
  @Override
  public String requestHandler(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    RentcarDao rdao = RentcarDao.getInstance();
    int category = Integer.parseInt(request.getParameter("category"));
    ArrayList<Rentcar> cartegoryList = new ArrayList<>();
    if (category == 0) {
      cartegoryList = rdao.getAllCar();
    }else{
      cartegoryList = rdao.getCategoryCar(category);
    }
    // 카테고리 분류 값 받아옴(int 타입)


    String temp = "";
    if (category == 1) {
      temp = "소형";
    }
    else if (category == 2) {
      temp = "중형";
    }
    else if (category == 3) {
      temp = "대형";
    }

    request.setAttribute("temp", temp);

    String center = request.getParameter("center");
    request.setAttribute("center", center);
    request.setAttribute("cartegoryList", cartegoryList);
    return "main";
  }
}
