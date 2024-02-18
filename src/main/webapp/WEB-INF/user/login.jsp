<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
  <style>
      .loginBox{
          margin: auto;
      }

      .btnGroup > .btn-login {
          background-color : oklch(0.4912 0.3096 275.75) !important;
      }

      .btnGroup > .btn-login:hover {
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
      <div class="loginBox flex flex-col w-[500px] h-[300px] p-[20px]">
        <div class="head">
          <div class="loginTitle text-center text-[2rem] font-bold">
            로그인
          </div>
        </div>
        <div class="body flex items-center justify-center flex-grow">
            <div class="inputBox flex flex-col items-center gap-y-3">
              <input placeholder="아이디" id="id" name="id" type="text" class="input input-bordered w-full" />
              <input placeholder="비밀번호" id="pw" name="pw" type="password" class="input input-bordered w-full" />
            </div>
            <div class="btnGroup flex justify-center gap-x-3 mt-[5px]">
              <button type="button" id="login" class="btn btn-primary btn-login !text-[15px]">로그인</button>
              <button type="button" class="btn btn-secondary btn-cancel !text-[15px]">
                <a href="main.do">취소</a>
              </button>
            </div>
        </div>
      </div>

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
