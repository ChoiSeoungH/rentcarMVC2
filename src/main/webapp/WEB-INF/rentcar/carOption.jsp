<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<!DOCTYPE html>

<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
  <style>
      #reservate-btn {
          background-color : oklch(0.4912 0.3096 275.75) !important;
      }

      #reservate-btn:hover {
          background-color : oklab(0.44208 0.0279164 -0.277238) !important;
      }
  </style>
</head>
<body class="bg-gray-100">
<c:set var="id" value="${sessionScope.id}"/>
<c:choose>
  <c:when test="${id eq null}">
    <script type="text/javascript">
      alert("로그인을 먼저 해주세요.");
      location.href = 'main.do?center=user/login.jsp';
    </script>
  </c:when>
</c:choose>

<form action="reservateCar.do" method="post" class="max-w-2xl mx-auto my-10 bg-white p-5 rounded shadow-md">
  <h2 class="text-2xl font-bold mb-5 text-gray-900">옵션 선택</h2>
  <div class="mb-4">
    <img src="img/${img}" class="w-full h-auto rounded"/>
  </div>
  <div class="grid grid-cols-2 gap-4">
    <div>
      <label class="block text-gray-700">대여기간</label>
      <select id="dday" name="dday" class="form-select mt-1 block w-full">
        <option value="1">1일</option>
        <option value="2">2일</option>
        <option value="3">3일</option>
        <option value="4">4일</option>
        <option value="5">5일</option>
        <option value="6">6일</option>
        <option value="7">7일</option>
      </select>
    </div>
    <div>
      <label class="block text-gray-700">대여일</label>
      <input type="date" name="rday" id="rday" class="form-input mt-1 block w-full" size="15">
    </div>
    <script>
      document.getElementById("rday").value = new Date().toISOString().substring(0, 10);
    </script>
    <div>
      <label class="block text-gray-700">보험적용</label>
      <select id="usein" name="usein" class="form-select mt-1 block w-full">
        <option value="1">적용(1일 1만원)</option>
        <option value="2">비적용</option>
      </select>
    </div>
    <div>
      <label class="block text-gray-700">Wifi 적용</label>
      <select id="usewifi" name="usewifi" class="form-select mt-1 block w-full">
        <option value="1">적용(1일 1만원)</option>
        <option value="2">비적용</option>
      </select>
    </div>
    <div>
      <label class="block text-gray-700">네비게이션 적용</label>
      <select id="usenavi" name="usenavi" class="form-select mt-1 block w-full">
        <option value="1">적용(무료)</option>
        <option value="2">비적용</option>
      </select>
    </div>
    <div>
      <label class="block text-gray-700">베이비시트 적용</label>
      <select id="useseat" name="useseat" class="form-select mt-1 block w-full">
        <option value="1">적용(1일 1만원)</option>
        <option value="2">비적용</option>
      </select>
    </div>
  </div>
  <input type="hidden" name="no" value="${no}">
  <input type="hidden" id="qty" name="qty" value="${qty}">
  <input type="button" id="reservate-btn" value="차량예약하기" data-no="${no}"
         class="mt-5 text-white font-bold py-2 px-4 rounded">
</form>

<dialog id="my_modal" class="modal">
  <div class="modal-box w-11/12 max-w-5xl p-6 bg-white rounded-md">
    <h3 class="font-bold text-2xl mb-4">차량 예약 완료 화면</h3>
    <div class="flex justify-center">
      <img src="img/${img}" class="w-3/4 h-auto"/>
    </div>
    <div class="text-center mt-4">
      <p class="text-lg mb-2">차량 총예약 금액 <span id="totalCarValue"></span></p>
      <p class="text-lg mb-2">차량 총옵션 금액 <span id="totalOptionValue"></span></p>
      <p class="text-lg mb-2">차량 총 금액 <span id="totalAmountValue"></span></p>
    </div>
    <div class="modal-action mt-6">
      <form method="dialog">
        <button
            class="btn bg-gray-300 hover:bg-gray-400 text-gray-800 font-bold py-2 px-4 rounded inline-flex items-center"
            id="close-btn">
          <svg xmlns="http://www.w3.org/2000/svg" fill="none" stroke="currentColor" stroke-linecap="round"
               stroke-linejoin="round" stroke-width="2" viewBox="0 0 24 24" class="w-5 h-5 mr-1">
            <path d="M15 19l-7-7 7-7"></path>
          </svg>
          Close
        </button>
      </form>
    </div>
  </div>
</dialog>


</body>
</html>

<script>
  $("#reservate-btn").click(function () {
    let query = {
      no: $(this).data("no"),
      qty: $("#qty").val(),
      dday: $("#dday").val(),
      rday: $("#rday").val(),
      usein: $("#usein").val(),
      usewifi: $("#usewifi").val(),
      usenavi: $("#usenavi").val(),
      useseat: $("#useseat").val(),
    };

    $.ajax({
      type: "POST",
      url: "reservateCar.do",
      data: query,
      success: function (data) {
        if (data) {
          let result = JSON.parse(data);
          $("#totalCarValue").text(result.totalCar + " 원");
          $("#totalOptionValue").text(result.totalOption + " 원");
          $("#totalAmountValue").text(result.totalAmount + " 원");

          document.getElementById('my_modal').showModal();
          check = true;
        } else {
          alert("현재 시스템 날짜보다 이전 날짜는 선택할 수 없음");
          $("#rday").val(new Date().toISOString().substring(0, 10));
        }
      }
    });
  });

  document.querySelector("#close-btn").addEventListener("click", (e) => {
    window.location.href = "userReserveList.do";
  });
</script>