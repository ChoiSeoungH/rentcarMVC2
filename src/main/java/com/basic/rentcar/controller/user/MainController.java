package com.basic.rentcar.controller.user;

import com.basic.rentcar.fronController.Controller;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class MainController implements Controller {
  @Override
  public String requestHandler(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String center = request.getParameter("center");
//    if (center == null) {
//      center = "<table>" +
//          "<tr height=\"500\">" +
//          "<td align=\"center\">" +
//          "<img alt=\"\" src=\"img/17.jpg\" width=\"1000\">" +
//          "</td>" +
//          "</tr>" +
//          "</table>";
//    }

    request.setAttribute("center", center);

    return "main";
  }
}
