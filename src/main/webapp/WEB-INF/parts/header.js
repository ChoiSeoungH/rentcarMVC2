// 세션을 이용한 로그인 처리
var id = '<%= session.getAttribute("id") %>';

// 로그인이 되어있지 않다면
if (id == null || id.trim() === '') {
  id = "GUEST";
}

// DOM이 로드된 후 실행되는 함수
window.onload = function() {
  var idElement = document.getElementById("userId");
  var loginButton = document.getElementById("loginButton");
  var logoutButton = document.getElementById("logoutButton");

  idElement.innerHTML = id + "님";

  if (id === "GUEST") {
    loginButton.style.display = "block";
    logoutButton.style.display = "none";
  } else {
    loginButton.style.display = "none";
    logoutButton.style.display = "block";
  }
};