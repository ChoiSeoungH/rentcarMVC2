let JoinForm__submitDone;

function JoinForm_submit(form) {
  JoinForm__submitDone = false;

  if (JoinForm__submitDone) {
    alert('처리 중입니다.');
    return;
  }

  form.loginId.value = form.loginId.value.trim();

  if (form.loginId.value.length == 0) {
    alert('로그인 아이디를 입력해주세요');
    form.loginId.focus();
    return;
  }

  form.loginPw.value = form.loginPw.value.trim();

  if (form.loginPw.value.length == 0) {
    alert('로그인 비번을 입력해주세요');
    form.loginPw.focus();
    return;
  }

  form.loginPwConfirm.value = form.loginPwConfirm.value.trim();

  if (form.loginPwConfirm.value.length == 0) {
    alert('로그인 비번 확인을 입력해주세요');
    form.loginPwConfirm.focus();
    return;
  }

  if (form.loginPw.value != form.loginPwConfirm.value) {
    alert('로그인 비번이 일치하지 않습니다.');
    form.loginPwConfirm.focus();
    return;
  }

  form.email.value = form.email.value.trim();
  if (form.email.value.length == 0) {
    alert('이메일을 입력해주세요.');
    form.email.focus();
    return;
  }

  if (!form.email.value.match(/[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$/)) {
    alert("이메일 형식이 다릅니다");
    form.email.focus();
    return false;
  }

  form.tel.value = form.tel.value.trim();
  if (form.tel.value.length == 0) {
    alert('전화번호를 입력해주세요.');
    form.tel.focus();
    return;
  }

  if (!form.tel.value.match(/010-\d{3,4}-\d{4}/)) {
    alert("전화번호 형식이 다릅니다");
    form.tel.focus();
    return false;
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
  form.submit();
  JoinForm__submitDone = true;
}