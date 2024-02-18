<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
  <link href="https://cdn.jsdelivr.net/npm/daisyui@4.7.2/dist/full.min.css" rel="stylesheet" type="text/css"/>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" type="text/css" href="${ctx}/css/style.css">

</head>
<body>

<c:set var="id" value="${sessionScope.id}"/>
<c:if test="${id eq null}">
  <c:set var="id" value="GUEST"/>
</c:if>

<header class="navbar bg-[#cfcfcf] border-b-2">
  <div class="con mx-auto w-[1100px]">
    <a href="main.do" style="text-decoration: none">
      <img alt="Tailwind CSS Navbar component" src="img/logo.png" width="100px">
    </a>
    <nav class="menu-box-1">
      <ul>
        <li><a href="carMain.do?center=rentcar/carMain.jsp" >예약하기</a></li>
        <li><a href="userReserveList.do" >예약확인</a></li>
        <li><a href="main.do?center=rentcar/freeBoard.jsp" >자유게시판</a></li>
        <li><a href="#" >이벤트</a></li>
        <li><a href="#" >고객센터</a></li>
        <c:if test="${id eq 'ADMIN'}">
          <li><a href="main.do?center=rentcar/carInsert.jsp" >차량등록</a></li>
        </c:if>
      </ul>
    </nav>
    <div>
      <c:choose>
        <c:when test="${id eq 'GUEST'}">
          ${id}님
          <button onclick="location.href='main.do?center=user/login.jsp'">로그인</button>
          <button onclick="location.href='main.do?center=user/join.jsp'">회원가입</button>
        </c:when>
        <c:otherwise>
          <a href="userInfo.do" style="text-decoration: none">${id}님</a>
          <button onclick="location.href='logoutCheck.do'">로그아웃</button>
        </c:otherwise>
      </c:choose>
    </div>
  </div>
</header>
