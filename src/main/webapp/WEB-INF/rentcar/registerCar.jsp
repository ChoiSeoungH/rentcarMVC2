<%@page import="java.util.ArrayList"%>
<%@ page import="com.basic.rentcar.dao.RentcarDao" %>
<%@ page import="com.basic.rentcar.vo.Rentcar" %>


<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
</head>
<body>
<%
  // 데이터베이스에 연결하여, 최신순 자동차 3대만뿌려주는 데이터를 가져옴
  RentcarDao rdao = RentcarDao.getInstance();

  ArrayList<Rentcar> v = rdao.getSelectCar();
%>

<div align="center">

  <table>
    <tr height="60">
      <td align="center" colspan="3">
        <font size="6" color="gray">최신형 자동차</font>
      </td>
    </tr>
    <tr height="240">
      <%
        for(int i=0; i<v.size(); i++){
          Rentcar bean = v.get(i);
      %>
      <td width="333" align="center">
        <a href="main.do?center=carInfo.do?no=<%= bean.getNo() %>">
          <img alt="" src="img/<%=bean.getImg() %>" width="300" height="220">
        </a><p>
        차량명 : <%= bean.getName() %>
      </td>
      <%} %>
    </tr>
  </table>

  <!-- ================================================== -->

  <hr size="3" color="red">
  <p>
    <font size="4" color="gray"><b>차량 검색 하기</b></font>

  <form action="main.do?center=carList.do" method="post">
    <font size="3" color="gray"><b>차량 검색 하기</b></font>&nbsp;&nbsp;
    <select name="category">
      <option value="1">소형</option>
      <option value="2">중형</option>
      <option value="3">대형</option>
    </select>
    <input type="submit" value="검색" />&nbsp;&nbsp;
  </form>
  <%-- button은 form 밖에 위치시키기 --%>
  <button onclick="location.href='main.do?center=carList.do'">전체 검색</button>
</div>


</body>
</html>