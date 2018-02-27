
var check = function() {
  if (document.getElementById('user_password').value ==
    document.getElementById('user_password_confirmation').value)  {

    document.querySelector('.octicon-smiley').classList.remove('hide')
    document.querySelector('.octicon-alert').classList.add('hide')

    document.getElementById('message').style.color = 'green';
    document.getElementById('message').innerHTML = 'Пароли совпадают';

  } else if (document.getElementById('user_password').value !=
    document.getElementById('user_password_confirmation').value && document.getElementById('user_password_confirmation').value != '')  {

    document.querySelector('.octicon-smiley').classList.add('hide')
    document.querySelector('.octicon-alert').classList.remove('hide')

    document.getElementById('message').style.color = 'red';
    document.getElementById('message').innerHTML = 'Пароли не совпадают';
  }
}

