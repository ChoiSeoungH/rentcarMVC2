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
<div align="center">
  <table>
    <tr height="60">
      <td align="center" colspan="3"><font size="6" color="gray">${temp}
        자동차</font></td>
    </tr>

    <c:forEach var="bean" items="${cartegoryList}" varStatus="status">
      <c:if test="${status.index % 3 == 0}">
        <tr height="220">
      </c:if>

      <td width="333" align="center">
        <a href="carInfo.do?no=${bean.no}&center=rentcar/rentCarInfo.jsp">
          <img alt="" src="img/${bean.img}" width="300" height="200">
        </a>
        <p>
          <font size="3" color="gray"><b>차량명 | ${bean.name}</b></font>
        </p>
      </td>

      <c:if test="${(status.index + 1) % 3 == 0}">
        </tr>
      </c:if>
    </c:forEach>
    </tr>
  </table>
</div>
</body>
</html>