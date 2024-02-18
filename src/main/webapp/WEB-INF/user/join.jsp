<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Title</title>
  <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
  <script defer src="/script/join.js"></script>
  <style>
      .joinBox{
          margin: auto;
      }

      .btnGroup > .btn-join {
          background-color : oklch(0.4912 0.3096 275.75) !important;
      }

      .btnGroup > .btn-join:hover {
          background-color : oklab(0.44208 0.0279164 -0.277238) !important;
      }

      .btnGroup > .btn-cancel {
          background-color : oklch(0.6971 0.329 342.55) !important;
      }

      .btnGroup > .btn-cancel:hover {
          background-color : oklab(0.62739 0.282473 -0.0887925) !important;
      }
      .body{
          display: flex;
          flex-direction: column;
      }
  </style>
</head>
<body>
<form action="joinUser.do" method="POST" onsubmit="JoinForm_submit(this); return false;">
<div class="joinBox flex flex-col w-[500px] h-[800px] p-[20px]">
  <div class="head">
    <div class="loginTitle text-center text-[2rem] font-bold">
      회원가입
    </div>
  </div>
  <div class="body flex items-center justify-center flex-grow">
    <div class="inputBox flex flex-col items-center gap-y-3">
      <div class="flex gap-x-3">
        <input placeholder="아이디" id="id" name="loginId" type="text" class="input input-bordered"/>
        <button type="button" id="checkId">중복체크</button>
      </div>
      <input placeholder="비밀번호" name="loginPw" type="password" class="input input-bordered w-full"/>
      <input placeholder="비밀번호 확인" type="password" name="loginPwConfirm" class="input input-bordered w-full"/>
      <input placeholder="이메일" type="email" name="email" class="input input-bordered w-full"/>
      <input placeholder="전화번호" type="tel" name="tel" class="input input-bordered w-full"/>
      <input placeholder="취미" type="text" name="hobby" class="input input-bordered w-full"/>
      <input placeholder="직업" type="text" name="job" class="input input-bordered w-full"/>
      <input placeholder="나이" type="number" name="age" class="input input-bordered w-full"/>
      <textarea placeholder="자기소개" type="text" name="info" class="input input-bordered w-full h-[150px]">반갑습니다</textarea>
    </div>
    <div class="btnGroup flex justify-center gap-x-3 mt-[5px]">
      <button type="submit" id="login" class="btn btn-primary btn-join !text-[15px]">회원가입</button>
      <button type="button" class="btn btn-secondary btn-cancel !text-[15px]">
        <a href="main.do">취소</a>
      </button>
    </div>
  </div>
</div>
</form>
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