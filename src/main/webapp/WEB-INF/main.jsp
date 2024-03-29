<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file= "parts/header.jsp" %>
    <%-- center 부분 --%>
    <tr align="center">
      <td align="center" width="1000">
        <c:choose>
          <c:when test="${ center eq null }">
            <table>
              <tr height="500">
                <td align="center">
                  <img alt="" src="img/main.png" width="1000">
                </td>
              </tr>
            </table>
          </c:when>
          <c:otherwise>
            <jsp:include page="${center}"/>
          </c:otherwise>
        </c:choose>

      </td>
    </tr>
    <%-- bottom 부분 --%>
    <tr height="100" align="center">
      <td align="center" width="1000">
        <%@ include file= "parts/footer.jsp" %>
