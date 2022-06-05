document.getElementById("password").addEventListener("keyup", password_validation);
document.getElementById("password_confirmation").addEventListener("keyup", password_validation);


function password_validation() {
  passEl = document.getElementById("password")
  passconfirmEl = document.getElementById("password_confirmation")
  submit = document.getElementById("submit")

  if (passEl.value !== passconfirmEl.value) {
    submit.disabled = true
  } else {
    submit.disabled = false
  }
}
