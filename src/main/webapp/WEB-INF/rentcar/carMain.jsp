<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
  <style>

      .btn-search {
          background-color : oklch(0.4912 0.3096 275.75) !important;
      }

      .btn-search:hover {
          background-color : oklab(0.44208 0.0279164 -0.277238) !important;
      }

  </style>
</head>
<body>

<div class="flex flex-col items-center">

  <div class="grid grid-cols-3 gap-4">
    <c:forEach var="vo" items="${list}">
      <div class="bg-gray-800 p-3">
        <a href="carInfo.do?no=${vo.no}&center=rentcar/rentCarInfo.jsp">
          <img alt="" src="img/${vo.img}" width="300" height="220">
        </a>
        <p class="text-white">차량명 : ${vo.name}</p>
      </div>
    </c:forEach>
  </div>

  <hr class="border-red-500 w-full my-4">

  <form action="carList.do?center=rentcar/rentCarList.jsp" method="post" class="mt-4 w-full flex flex-col items-center">
    <label class="block text-gray-700 text-sm font-bold mb-2">차량 검색 하기:</label>
    <div class="inline-block relative w-64">
      <select name="category" class="block appearance-none w-full bg-white border border-gray-400 hover:border-gray-500 px-4 py-2 pr-8 rounded shadow leading-tight focus:outline-none focus:shadow-outline">
        <option value="1">소형</option>
        <option value="2">중형</option>
        <option value="3">대형</option>
      </select>
      <div class="pointer-events-none absolute inset-y-0 right-0 flex items-center px-2 text-gray-700">
        <svg class="fill-current h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"><path d="M10 12l-6-6h12l-6 6z"/></svg>
      </div>
    </div>
    <input type="submit" value="검색" class="btn btn-primary btn-search mt-2"/>
    <button onclick="location.href='carList.do?center=rentcar/rentCarList.jsp&category=0'" class="btn btn-secondary mt-2">전체 검색</button>
  </form>

</div>

</body>
</html>
