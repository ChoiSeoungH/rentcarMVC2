<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
  <!-- Tailwind CSS -->
  <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
  <!-- DaisyUI CSS -->
  <link href="https://cdn.jsdelivr.net/npm/daisyui@1.14.0/dist/full.css" rel="stylesheet">
</head>
<body>

<c:set var="id" value="${sessionScope.id}"/>
<c:choose>
  <c:when test="${id eq null}">
    <script type="text/javascript">
      alert("로그인을 먼저 해주세요.");
      location.href = 'main.do?center=user/login.jsp';
    </script>
  </c:when>
</c:choose>

<div align="center">
  <table class="table w-full">
    <thead>
    <tr>
      <th>이미지</th>
      <th>이름</th>
      <th>대여일</th>
      <th>대여기간</th>
      <th>금액</th>
      <th>수량</th>
      <th>보험</th>
      <th>wifi</th>
      <th>베이비시트</th>
      <th>네비게이션</th>
      <th>삭제</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="vo" items="${reserveList}">
      <tr>
        <td><img src="img/${vo.img}"  width="120" height="70"></td>
        <td>${vo.name}</td>
        <td>${vo.rday}</td>
        <td>${vo.dday}</td>
        <td>${vo.price} 원</td>
        <td>${vo.qty}</td>
        <td>${vo.usein}</td>
        <td>${vo.usewifi}</td>
        <td>${vo.useseat}</td>
        <td>${vo.usenavi}</td>
        <td>
          <button onclick="location.href='deleteRes.do?resSeq=${vo.reserveSeq}&qty=${vo.qty}&no=${vo.no}&center=rentcar/userReserveList.jsp'" class="btn btn-outline btn-accent">삭제</button>
        </td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
</div>
</body>
</html>
