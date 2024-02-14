<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>

</head>
<body>
  <table border="1">
    <tr height="100">
      <td align="center" colspan="2">
        <font size="6" color="gray"> 로그인 </font>
      </td>
    </tr>
    <tr height="40">
      <td width="120" align="center"> 아이디 </td>
      <td width="180"> <input type="text" id="id" name="id" size="15" required/> </td>
    </tr>
    <tr height="40">
      <td width="120" align="center"> 패스워드 </td>
      <td width="180"> <input type="password" id="pw" name="pw" size="15" required /> </td>
    </tr>
    <tr height="40">
      <td align="center" colspan="2">
        <button id="login">로그인</button>
      </td>
    </tr>
  </table>
</body>
</html>
<script>
  $("#login").click(function() {
    let query = {
      id: $("#id").val(),
      pw: $("#pw").val()
    };

    $.ajax({
      type: "POST",
      url: "loginCheck.do",
      data: query,
      success: function(data) {
        if ($("#id").val().trim().length === 0) {
          alert("id 값을 입력해주세요");
          $("#id").focus();
          $("#id").css("border", "");
          return;
        }
        if ($("#pw").val().trim().length === 0) {
          alert("pw 값을 입력해주세요");
          $("#pw").focus();
          $("#pw").css("border", "");
          return;
        }
        if (data!=0) {
          alert("로그인 성공");
          window.location.href = "main.do";
        } else {
          alert("아이디와 패스워드를 확인해주세요.");
          $("#id").val("");
          $("#pw").val("");
        }
      }
    });
  });

</script>
