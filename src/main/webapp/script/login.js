  $("#login").click(function() {
  let query = {
  id: $("#id").val(),
  pw: $("#pw").val()
};

  $.ajax({
  type: "POST",
  url: "memberLogin.do",
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
  if (data!==0) {
  alert("로그인 성공");
  window.location.href = "loginCheck.do";
} else {
  alert("아이디와 패스워드를 확인해주세요.");
  $("#id").val("");
  $("#pw").val("");
}
}
});
});
