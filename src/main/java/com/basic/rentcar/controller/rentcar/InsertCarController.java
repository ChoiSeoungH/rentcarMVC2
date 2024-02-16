package com.basic.rentcar.controller.rentcar;

import com.basic.rentcar.dao.RentcarDao;
import com.basic.rentcar.dao.UserDao;
import com.basic.rentcar.fronController.Controller;
import com.basic.rentcar.vo.Rentcar;
import com.basic.rentcar.vo.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class InsertCarController implements Controller {
  @Override
  public String requestHandler(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    int no = Integer.parseInt(RentcarDao.getInstance().getNextNo());
    String name=request.getParameter("name");
    int category=0;
    int price= Integer.parseInt(request.getParameter("price"));
    int usepeople= Integer.parseInt(request.getParameter("usepeople"));
    int totalQty= Integer.parseInt(request.getParameter("totalQty"));
    String company=request.getParameter("company");
    String img=no+".jpg";
    String info=request.getParameter("info");
    System.out.println("category : " + request.getParameter("category"));
    switch (request.getParameter("category")) {
      case "대형": category =3;
        break;
      case "중형": category =2;
        break;
      case "소형": category =1;
        break;
    }
    Rentcar vo=new Rentcar();
    vo.setName(name);
    vo.setCategory(category);
    vo.setPrice(price);
    vo.setUsepeople(usepeople);
    vo.setTotalQty(totalQty);
    vo.setCompany(company);
    vo.setImg(img);
    vo.setInfo(info);

    int cnt= RentcarDao.getInstance().insertCar(vo);
    if(cnt>0) {
      String ctx = request.getContextPath();
      return "redirect:"+ctx+ String.format("/carInfo.do?no=%d",no);
    }else {
      throw new ServletException("not insert");
    }
  }
}
