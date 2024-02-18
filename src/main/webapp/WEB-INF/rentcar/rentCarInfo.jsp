<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>10_carReserveInfo</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/daisyui@1.1.0/dist/full.css">
</head>
<body class="bg-gray-100">

<c:choose>
  <c:when test="${bean.totalQty eq 0}">
    <script>
      alert(" 이 차랑은 모두 대여 중입니다");
      location.href = "main.do?center=rentcar/rentCarList.jsp"
    </script>
  </c:when>
</c:choose>
<form action="selectCarOption.do" method="post">
  <div class="flex justify-center mt-10">

    <div class="bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4 flex flex-col">
      <div class="mb-4">
        <label class="block text-grey-darker text-sm font-bold mb-2">${bean.name} 차량 선택</label>
        <img alt="" src="img/${bean.img}" width="450">
        <p>차량이름 : ${bean.name}</p>
        <p>총 승차인원 : ${bean.usepeople}</p>
        <p>차량수량 :
          <select name="qty" class="shadow appearance-none border rounded w-full py-2 px-3 text-grey-darker">
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
        </p>
        <p>차량분류 : ${temp}</p>
        <p>대여가격 : ${bean.price}원</p>
        <p>제조회사 : ${bean.company}</p>
      </div>

      <c:if test="${not empty sessionScope.id}">
        <input type="hidden" name="no" value="${bean.no}"/>
        <input type="hidden" name="img" value="${bean.img}"/>
        <button type="submit"
                class="bg-blue-500 text-white font-bold py-2 px-4 rounded">
          옵션선택후 렌트 예약 하기
        </button>
      </c:if>

      <div class="mt-4">
        <h2 class="font-bold text-lg mb-2">차량 정보 보기</h2>
        <p>${bean.info}</p>
      </div>

    </div>

  </div>
</form>
</body>
</html>
