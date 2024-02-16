<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Title</title>
  <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
  <script defer src="/script/join.js"></script>
</head>
<body>

<div class="member_join_box">
  <div class="con">
    <form action="joinUser.do" method="POST" onsubmit="JoinForm_submit(this); return false;">
      <table>
        <tr>
          <td><h1>회원가입</h1></td>
        </tr>
        <tr>
          <td>로그인 아이디 : <input placeholder="아이디를 입력해주세요." name="loginId" id="id" type="text">
            <input type="button" value="중복체크" id="checkId"></td>
        </tr>
        <tr>
          <td>로그인 패스워드 : <input placeholder="비밀번호를 입력해주세요." name="loginPw" type="password"></td>
        </tr>
        <tr>
          <td>로그인 패스워드 확인 : <input placeholder="비밀번호를 확인을 입력해주세요." name="loginPwConfirm" type="password"></td>
        </tr>
        <tr>
          <td>이메일 : <input placeholder="이메일을 입력해주세요." name="email" type="email"></td>
        </tr>
        <tr>
          <td>전화번호 : <input placeholder="전화번호를 입력해주세요." name="tel" type="tel"></td>
        </tr>
        <tr>
          <td>취미 : <input placeholder="취미를 입력해주세요." name="hobby" type="text"></td>
        </tr>
        <tr>
          <td>직업 : <input placeholder="직업을 입력해주세요." name="job" type="text"></td>
        </tr>
        <tr>
          <td>나이 : <input placeholder="나이를 입력해주세요." name="age" type="text"></td>
        </tr>
        <tr>
          <td>자기소개 : <input value="반갑습니다" name="info" type="text"></td>
        </tr>
        <tr>
          <td>
            <div class="btn-group">
              <button id="join" type="submit">회원가입</button>
              <button type="button">
                <a href="main.do">취소</a>
              </button>
            </div>
          </td>
        </tr>
      </table>
    </form>
  </div>
</div>
</body>
</html>

<script>
  $("#checkId").click(function () {
    let id = $("#id").val().trim();
    console.log(id);
    if (id.length === 0) {
      alert("id 값을 입력해주세요");
      $("#id").focus();
      $("#id").css("border", "");
      return;
    }
    $.ajax({
      type: "POST",
      url: "validateId.do",
      data: { id: id },
      success: function(data) {
        if (data === "valid") {
          alert("이 아이디는 사용가능 합니다  ");
          $("#pw").focus();
          $("#id").css("border", "3px blue solid");
          check = 1;
        } else if (data === "notValid") {
          alert("이 아이디는 사용 불가능 합니다");
          $("#id").val("");
          $("#id").focus();
          $("#id").css("border", "3px red solid");
          check = -1;
        }
      },
      error: function () {
        alert("error");
      }
    });
  });

  $("#id").keyup(function (e) {
    // if (e.keyCode === 8) {
    check = 0;
    // }
    $("#id").css("border", "");
  });
</script>