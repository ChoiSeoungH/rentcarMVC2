<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>Title</title>
  <script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<form action="updateUser.do" method="post" onsubmit="userForm_submit(this); return false;">
  <input type="hidden" name="no" value="${vo.no}"/>
  <table>
    <tr>
      <td>번호</td>
      <td class="left" id="no">${vo.no}</td>
    </tr>
    <tr>
      <td>아이디</td>
      <td class="left" id="id">${vo.id}</td>
    </tr>
    <tr>
      <td>비밀번호</td>
      <td><input class="col-12" type="text" id="pw" name="pw"/>
        <input type="button" value="비밀번호체크" id="checkPw"></td>
    </tr>
    <tr>
      <td>비밀번호확인</td>
      <td><input class="col-12" type="text" name="pwConfirm"/></td>
    </tr>
    <tr>
      <td>이메일</td>
      <td><input class="col-12" type="text" name="email" value="${vo.email}"/></td>
    </tr>
    <tr>
      <td>전화번호</td>
      <td><input class="col-12" type="text" name="tel" value="${vo.tel}"/></td>
    </tr>
    <tr>
      <td>취미</td>
      <td><input class="col-12" type="text" name="hobby" value="${vo.hobby}"/></td>
    </tr>
    <tr>
      <td>직업</td>
      <td><input class="col-12" type="text" name="job" value="${vo.job}"/></td>
    </tr>
    <tr>
      <td>나이</td>
      <td><input class="col-12" type="text" name="age" value="${vo.age}"/></td>
    </tr>
    <tr>
      <td>자기소개</td>
      <td><input class="col-12" type="text" name="info" value="${vo.info}"/></td>
    </tr>
    <tr>
      <td colspan="2" align="center">
        <input type="submit" id="submitBtn" value="수정하기"/>
      </td>
      <td colspan="2" align="center">
        <input type="button" id="delBtn" value="탈퇴하기"/>
      </td>
    </tr>
  </table>
</form>
</body>
</html>

<script>
  let userFormSubmitDone;
  let check = false;

  function userForm_submit(form) {
    userFormSubmitDone = false;
    if (!check) {
      alert('비밀번호를 확인 해주세요');
      return;
    }

    if (userFormSubmitDone) {
      alert('처리 중입니다.');
      return;
    }
    form.pwConfirm.value = form.pwConfirm.value.trim();

    if (form.pwConfirm.value.length == 0) {
      alert('비밀번호 확인을 입력해주세요');
      form.pwConfirm.focus();
      return;
    }

    if (form.pw.value != form.pwConfirm.value) {
      alert('비밀번호가 일치하지 않습니다.');
      form.pwConfirm.focus();
      return;
    }

    form.email.value = form.email.value.trim();
    if (form.email.value.length == 0) {
      alert('이메일을 입력해주세요.');
      form.email.focus();
      return;
    }

    form.tel.value = form.tel.value.trim();
    if (form.tel.value.length == 0) {
      alert('전화번호를 입력해주세요.');
      form.tel.focus();
      return;
    }

    form.hobby.value = form.hobby.value.trim();
    if (form.hobby.value.length == 0) {
      alert('취미를 입력해주세요.');
      form.hobby.focus();
      return;
    }

    form.job.value = form.job.value.trim();
    if (form.job.value.length == 0) {
      alert('직업을 입력해주세요.');
      form.job.focus();
      return;
    }

    form.age.value = form.age.value.trim();
    if (form.age.value.length == 0) {
      alert('나이를 입력해주세요.');
      form.age.focus();
      return;
    }

    form.info.value = form.info.value.trim();
    if (form.info.value.length == 0) {
      alert('자기소개를 입력해주세요.');
      form.info.focus();
      return;
    }

    if (check) {
      form.submit();
      userFormSubmitDone = true;
    }
  }
  $("#checkPw").click(function () {
    let id;
    $(document).ready(function() {
      id = $("#id").text();
    });
    let pw = $("#pw").val().trim();

    if (pw.length === 0) {
      alert("pw 값을 입력해주세요");
      $("#pw").focus();
      $("#pw").css("border", "");
      return;
    }
    console.log(id);
    console.log(pw);
    $.ajax({
      type: "POST",
      url: "validateId.do",
      data: {
        id: id,
        pw: pw
      },
      success: getResult,
      error: function () {
        alert("error");
      }
    });
  });

  function getResult(data) {
    if (data === "valid") {
      alert("비밀번호 일치");
      check = true;
    } else if (data === "notValid") {
      alert("비밀번호가 일치하지 않습니다.");
      $("#pw").val("");
      $("#pw").focus();
      $("#pw").css("border", "3px red solid");
      check = false;
    }
  }


  $("#pw").keyup(function (e) {
    // if (e.keyCode === 8) {
    check = false;
    // }
    $("#pw").css("border", "");
  });

  //회원탈퇴
  $("#delBtn").click(function () {
    let no;
    $(document).ready(function() {
      no = $("#no").text();
    });
    $.ajax({
      type: "POST",
      url: "deleteUser.do",
      data: {no: no},
      success: getResult,
      error: function () {
        alert("error");
      }
    });
  });

  function getResult(data) {
    if (data > 0) {
      alert("탈퇴성공");
      window.location.href = "main.do";
    } else {
      alert("not quit");
    }
  }

</script>