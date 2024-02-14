<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
  <script type="text/javascript" src="./parts/header.js"></script>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
</head>
<body>
<div align="center">
  <table>
    <%-- top 부분 --%>
    <tr height="120" align="center">
      <td align="center" width="1000">
        <table>
          <tr height="70">
            <td colspan="4">
              <a href="01_carMain.jsp" style="text-decoration: none">
                <img alt="" src="img/rent_logo.jpg" height="120">
              </a>
            </td>
            <td align="center" width="200">

              <c:set var="id" value="${sessionScope.id}"/>
              <c:choose>
                <c:when test="${id == null || id eq ''}">
                  <c:set var="id" value="GUEST"/>
                </c:when>
              </c:choose>

              ${id}님
              <c:choose>
                <c:when test="${id eq 'GUEST'}">
                  <button onclick="location.href='01_carMain.jsp?center=05_memberLogin.jsp'"> 로그인</button>
                </c:when>
                <c:otherwise>
                  <button onclick="location.href='07_memberLogout.jsp'"> 로그아웃</button>
                </c:otherwise>
              </c:choose>

            </td>
          </tr>
          <tr height="50">
            <td align="center" width="200" bgcolor="pink">
              <font color="white" size="5"><a href="01_carMain.jsp?center=08_carReserveMain.jsp"
                                              style="text-decoration: none">예 약 하 기</a></font>
            </td>
            <td align="center" width="200" bgcolor="pink">
              <font color="white" size="5"><a href="01_carMain.jsp?center=14_carReserveView.jsp"
                                              style="text-decoration: none">예 약 확 인</a></font>
            </td>
            <td align="center" width="200" bgcolor="pink">
              <font color="white" size="5"><a href="#" style="text-decoration: none">자유게시판</a></font>
            </td>
            <td align="center" width="200" bgcolor="pink">
              <font color="white" size="5"><a href="#" style="text-decoration: none">이 벤 트</a></font>
            </td>
            <td align="center" width="200" bgcolor="pink">
              <font color="white" size="5"><a href="#" style="text-decoration: none">고 객 센 터</a></font>
            </td>
          </tr>
        </table>
      </td>
    </tr>
    <%-- center 부분 --%>
    <tr align="center">
      <td align="center" width="1000">
        <jsp:include page="${center}"/>
      </td>
    </tr>
    <%-- bottom 부분 --%>
    <tr height="100" align="center">
      <td align="center" width="1000">
        <script type="text/javascript" src="./parts/footer.js"></script>
      </td>
    </tr>
  </table>

</div>
</body>
</html>