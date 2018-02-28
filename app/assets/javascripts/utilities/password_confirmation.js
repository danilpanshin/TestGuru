document.addEventListener('turbolinks:load', function () {
    var control = document.getElementById('user_password_confirmation')

    var controlPC = document.getElementById('user_password') //зачем так? для той ситуации, когда сначала вводишь пароль в поле пассворд конфирмэйшн, а потом в поле пароль. 

    if (control) { control.addEventListener('input', check) }

    if (controlPC) { controlPC.addEventListener('input', check) } //зачем так? для той ситуации, когда сначала вводишь пароль в поле пассворд конфирмэйшн, а потом в поле пароль. 
});

var check = function() {
  var password = document.getElementById('user_password').value
  var conf_password = document.getElementById('user_password_confirmation').value
  var message = document.getElementById('message')
  var smiley = document.querySelector('.octicon-smiley')
  var alert =  document.querySelector('.octicon-alert')

  if (password == conf_password && conf_password != '')  {

    smiley.classList.remove('hide')
    alert.classList.add('hide')

    message.style.color = 'green';
    message.textContent = 'Пароли совпадают';

  } else if (password != conf_password && conf_password != '')  {

    smiley.classList.add('hide')
    alert.classList.remove('hide')

    message.style.color = 'red';
    message.textContent = 'Пароли не совпадают';
  }
}

