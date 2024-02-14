<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
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


<c:set var="compare" value="${compare}"/>
<c:choose>
  <c:when test="${compare < 0}">
    <script type="text/javascript">
      alert("현재 시스템 날짜보다 이전 날짜는 선택할 수 없음");
      history.go(-1);
    </script>
  </c:when>
</c:choose>


<div align="center">
  <table>
    <tr height="100">
      <td align="center">
        <font size="6" color="gray"> 차량 예약 완료 화면 </font>
      </td>
    </tr>
    <tr height="100">
      <td align="center">
        <img src="img/${cbean.img}" width="470" />
      </td>
    </tr>
    <tr height="50">
      <td align="center">
        <font size="5" color="red"> 차량 총예약 금액 ${totalCar} 원 </font>
      </td>
    </tr>
    <tr height="50">
      <td align="center">
        <font size="5" color="red"> 차량 총옵션 금액 ${totalOption} 원 </font>
      </td>
    </tr>
    <tr height="50">
      <td align="center">
        <font size="5" color="red"> 차량 총 금액 ${totalOption + totalCar} 원 </font>
      </td>
    </tr>
  </table>
</div>
</body>
</html>