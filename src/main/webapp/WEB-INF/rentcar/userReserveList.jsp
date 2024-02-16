<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
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

<div align="center">
  <table>
    <tr height="100">
      <td align="center" colspan="11">
        <font size="6" color="gray"> 차량 예약 완료 화면 </font>
      </td>
    </tr>
  </table>
  <table border="1">
    <tr height="40">
      <td width="150" align="center"> 이미지 </td>
      <td width="150" align="center"> 이름 </td>
      <td width="150" align="center"> 대여일 </td>
      <td width="60" align="center"> 대여기간 </td>
      <td width="100" align="center"> 금액 </td>
      <td width="60" align="center"> 수량 </td>
      <td width="60" align="center"> 보험 </td>
      <td width="60" align="center"> wifi </td>
      <td width="60" align="center"> 베이비시트 </td>
      <td width="60" align="center"> 네비게이션 </td>
      <td width="90" align="center"> 삭제 </td>
    </tr>
    <c:forEach var="vo" items="${reserveList}">
      <tr height="70">
        <td height="70" align="center">
          <img src="img/${vo.img}"  width="120" height="70">
        </td>
        <td width="100" align="center">${vo.name}</td>
        <td width="150" align="center">${vo.rday}</td>
        <td width="150" align="center">${vo.dday}</td>
        <td width="100" align="center">${vo.price} 원</td>
        <td width="60" align="center">${vo.qty}</td>
        <td width="100" align="center">${vo.usein}</td>
        <td width="60" align="center">${vo.usewifi}</td>
        <td width="60" align="center">${vo.useseat}</td>
        <td width="60" align="center">${vo.usenavi}</td>
        <td width="90" align="center">
          <button onclick="location.href='deleteRes.do?resSeq=${vo.reserveSeq}&qty=${vo.qty}&no=${vo.no}&center=rentcar/userReserveList.jsp'">삭제</button>
        </td>
      </tr>
    </c:forEach>



  </table>
</div>
</body>
</html>