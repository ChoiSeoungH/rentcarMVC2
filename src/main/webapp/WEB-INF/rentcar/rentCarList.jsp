<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
  <!-- 슬릭 슬라이더 CSS -->
  <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
  <!-- 슬릭 슬라이더 테마 CSS (선택 사항) -->
  <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>
  <style>
      .slick-slider img {
          width: 300px;
          height: 200px;
          object-fit: cover;
      }
      .slick-prev:before,
      .slick-next:before {
          color: black;
      }
  </style>
</head>
<body>
<div align="center">
  <div class="slick-slider">
    <c:forEach var="bean" items="${cartegoryList}">
      <div>
        <a href="carInfo.do?no=${bean.no}&center=rentcar/rentCarInfo.jsp">
          <img alt="" src="img/${bean.img}">
        </a>
        <p>
          <font size="3" color="gray"><b>차량명 | ${bean.name}</b></font>
        </p>
      </div>
    </c:forEach>
  </div>
</div>

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- 슬릭 슬라이더 JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script>
  $(document).ready(function(){
    $('.slick-slider').slick({
      infinite: true,
      slidesToShow: 3,
      slidesToScroll: 3,
      arrows: true
    });
  });
</script>
</body>
</html>
