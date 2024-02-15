<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
  <link href="/css/style.css" rel="stylesheet">
</head>
<body>

<c:set var="id" value="${sessionScope.id}"/>
<c:choose>
<c:when test="${id eq null}">
  <c:set var="id" value="GUEST"/>
</c:when>
</c:choose>

<table>
  <tr height="70">
    <td colspan="4">
      <a href="main.do" style="text-decoration: none">
        <img alt="" src="img/rent_logo.jpg" height="120">
      </a>
    </td>
    <td align="center" width="200">

      <c:choose>
        <c:when test="${id eq 'GUEST'}">
          ${id}님
          <button onclick="location.href='main.do?center=user/login.jsp'">로그인</button>
          <button onclick="location.href='main.do?center=user/join.jsp'">회원가입</button>
        </c:when>
        <c:otherwise>
          <a href="userInfo.do?center=user/userInfo.jsp"
             style="text-decoration: none">${id}님</a></font>
          <button onclick="location.href='logoutCheck.do'">로그아웃</button>
        </c:otherwise>
      </c:choose>
    </td>
  </tr>
  <tr height="50">
    <td align="center" width="200" bgcolor="pink">
      <font color="white" size="5"><a href="carMain.do?center=rentcar/carMain.jsp"
                                      style="text-decoration: none">예약하기</a></font>
    </td>
    <td align="center" width="200" bgcolor="pink">
      <font color="white" size="5"><a href="userReserveList.do?center=rentcar/userReserveList.jsp"
                                      style="text-decoration: none">예약확인</a></font>
    </td>
    <td align="center" width="200" bgcolor="pink">
      <font color="white" size="5"><a href="#" style="text-decoration: none">자유게시판</a></font>
    </td>
    <td align="center" width="200" bgcolor="pink">
      <font color="white" size="5"><a href="#" style="text-decoration: none">이벤트</a></font>
    </td>
    <td align="center" width="200" bgcolor="pink">
      <font color="white" size="5"><a href="#" style="text-decoration: none">고객센터</a></font>
    </td>
  </tr>
</table>

