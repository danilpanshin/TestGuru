
var check = function() {
  if (document.getElementById('user_password').value ==
    document.getElementById('user_password_confirmation').value)  {
    document.getElementById('message').style.color = 'green';
    document.getElementById('message').innerHTML = 'Пароли совпадают';
  } else {
    document.getElementById('message').style.color = 'red';
    document.getElementById('message').innerHTML = 'Пароли не совпадают';
  }
}

