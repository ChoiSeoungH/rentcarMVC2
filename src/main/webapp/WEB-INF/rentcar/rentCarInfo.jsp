<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>10_carReserveInfo</title>
</head>
<body>
<c:choose>
  <c:when test="${bean.totalQty eq 0}">
    <script>
      alert(" 이 차랑은 모두 대여 중입니다");
      location.href="main.do?center=rentcar/rentCarList.jsp"
    </script>
  </c:when>
</c:choose>

<div align="center">
  <form action="selectCarOption.do?center=rentcar/carOption.jsp" method="post">
    <table>
      <tr height="100">
        <td align="center" colspan="3">
          <font size="6" color="gray">${bean.name} 차량 선택</font>
        </td>
      </tr>
      <tr>
        <td rowspan="6" width="500" align="center">
          <img alt="" src="img/${bean.img}" width="450">
        </td>
        <td width="250" align="center">차량이름</td>
        <td width="250" align="center">${bean.name}</td>
      </tr>
      <tr>
        <td width="250" align="center">총 승차인원</td>
        <td width="250" align="center">${bean.usepeople}</td>
      </tr>
      <tr>
        <td width="250" align="center">차량수량</td>
        <td width="250" align="center">
          <select name="qty">
            <c:forEach begin="1" end="${bean.totalQty}" var="i">
              <c:choose>
                <c:when test="${i eq 1}">
                  <option value="1" selected>1</option>
                </c:when>
                <c:otherwise>
                  <option value="${i}">${i}</option>
                </c:otherwise>
              </c:choose>
            </c:forEach>
          </select>
        </td>
      </tr>
      <tr>
        <td width="250" align="center">차량분류</td>
        <td width="250" align="center">${temp}</td>
      </tr>
      <tr>
        <td width="250" align="center">대여가격</td>
        <td width="250" align="center">${bean.price}원</td>
      </tr>
      <tr>
        <td width="250" align="center">제조회사</td>
        <td width="250" align="center">${bean.company}</td>
      </tr>
      <tr>
        <td width="250" align="center">
          <c:if test="${not empty sessionScope.id}">
            <input type="hidden" name="no" value="${bean.no}" />
            <input type="hidden" name="img" value="${bean.img}" />
            <input type="submit" value="옵션선택후 렌트 예약 하기" />
          </c:if>
        </td>
      </tr>
    </table>
    <br />
    <br />
    <br />
    <font size="5" color="gray">차랑 정보 보기</font>
    <p>${bean.info} </p>
  </form>
</div>
</body>
</html>
