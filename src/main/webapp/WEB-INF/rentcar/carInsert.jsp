<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head><title>FileUpload</title>
  <script src="http://code.jquery.com/jquery-latest.min.js"></script>
  <style>
      .insertBox{
          margin: auto;
      }

      .btnGroup > .btn-submit {
          background-color : oklch(0.4912 0.3096 275.75) !important;
      }

      .btnGroup > .btn-submit:hover {
          background-color : oklab(0.44208 0.0279164 -0.277238) !important;
      }

      .btnGroup > .btn-upload {
          background-color : oklch(0.6971 0.329 342.55) !important;
      }

      .btnGroup > .btn-upload:hover {
          background-color : oklab(0.62739 0.282473 -0.0887925) !important;
      }
      .body{
          display: flex;
          flex-direction: column;
      }
  </style>
</head>
<c:if test="${sessionScope.id ne 'ADMIN'}">
  <script type="text/javascript">
    alert("관리자 권한이 없습니다.");
    location.href = 'main.do';
  </script>
</c:if>
<body>

<span class="text-red-500">${errorMessage }</span>
<form name="fileForm" method="post" action="insertCar.do" onsubmit="insertSubmit(this); return false;">
  <div class="insertBox p-6 max-w-sm mx-auto bg-white rounded-xl shadow-md flex items-center space-x-4">
    <div>
      <h3 class="text-xl">차량 등록</h3>
      <p class="text-gray-500">이름 : <input type="text" name="name" class="form-input mt-1 block w-full"/></p>
      <p class="text-gray-500">카테고리 :
        <select name="category" class="form-select mt-1 block w-full">
          <option value="소형">소형</option>
          <option value="중형">중형</option>
          <option value="대형">대형</option>
        </select>
      </p>
      <p class="text-gray-500">가격 : <input type="text" name="price" class="form-input bordered mt-1 block w-full"/></p>
      <p class="text-gray-500">승차인원 : <input type="text" name="usepeople" class="form-input bordered mt-1 block w-full"/></p>
      <p class="text-gray-500">총수량 : <input type="text" name="totalQty" class="form-input bordered mt-1 block w-full"/></p>
      <p class="text-gray-500">차량 회사 정보 : <input type="text" name="company" class="form-input bordered mt-1 block w-full"/></p>
      <p class="text-gray-500">이미지 : <input type="file" id="img" name="img" class="form-input bordered mt-1 block w-full"/></p>
      <p class="text-gray-500">차량 정보 : <input type="text" name="info" class="form-input mt-1 bordered block w-full"/></p>
      <div class="mt-4 btnGroup">
        <input type="submit" id="submitBtn" value="전송하기" class="btn btn-primary btn-submit"/>
        <input type="button" id="imgBtn" value="이미지 업로드하기" class="btn btn-secondary btn-upload ml-2"/>
      </div>
    </div>
  </div>
</form>
</body>
</html>
<script>
  let check =false;
  function insertSubmit(form){
    if (!check) {
      alert("이미지를 업로드해주세요");
      $("#img").focus();
      $("#img").css("border", "");
      return;
    }
    form.submit();
  }


  $("#imgBtn").click(function() {
    // 이미지 파일 가져오기
    let ofile = $("#img")[0].files[0];

    if (!ofile) {
      alert("이미지를 첨부해주세요");
      $("#img").focus();
      $("#img").css("border", "");
      return;
    }

    // FormData 객체 생성
    let formData = new FormData();
    formData.append("ofile", ofile);

    $.ajax({
      type: "POST",
      url: "uploadCarImg.do",
      data: formData,
      contentType: false,
      processData: false,
      success: function(data) {
        if (data) {
          alert("업로드 성공");
          check = true;
        } else {
          alert("이미지를 확인해주세요.");
          $("#img").val("");
          check = false;
        }
      }
    });
  });

</script>
