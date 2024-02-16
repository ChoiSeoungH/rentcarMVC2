<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head><title>FileUpload</title>
  <script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<c:if test="${sessionScope.id ne 'ADMIN'}">
  <script type="text/javascript">
    alert("관리자 권한이 없습니다.");
    location.href = 'main.do';
  </script>
</c:if>
<body>

<span style="color: red;">${errorMessage }</span>
<form name="fileForm" method="post" action="insertCar.do" onsubmit="insertSubmit(this); return false;">
  <table>
    <tr>
      <td>
        <h3>차량 등록</h3>
      </td>
    </tr>
    <tr>
      <td>
        이름 : <input type="text" name="name"/>
      </td>
    </tr>
    <tr>
      <td>
        카테고리 : <select name="category">
          <option value="소형">소형</option>
          <option value="중형">중형</option>
          <option value="대형">대형</option>
        </select>
      </td>
    </tr>
    <tr>
      <td>
        가격 : <input type="text" name="price"/>
      </td>
    </tr>
    <tr>
      <td>
        승차인원 : <input type="text" name="usepeople"/>
      </td>
    </tr>
    <tr>
      <td>
        총수량 : <input type="text" name="totalQty"/>
      </td>
    </tr>
    <tr>
      <td>
        차량 회사 정보 : <input type="text" name="company"/>
      </td>
    </tr>
    <tr>
      <td>
        이미지 : <input type="file" id="img" name="img" />
      </td>
    </tr>
    <tr>
      <td>
        차량 정보 : <input type="text" name="info"/>
      </td>
    </tr>
    <tr>
      <td>
        <input type="submit" id="submitBtn" value="전송하기"/>
      </td>
      <td>
        <input type="button" id="imgBtn" value="이미지 업로드하기"/>
      </td>
    </tr>
  </table>
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