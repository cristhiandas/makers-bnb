$(document).ready(function() {
  $('#sign_up').click(function() {
    var username = $('#username').val();
    var email = $('#email').val();
    var password = $('#password').val();
    var password_confirmation = $('#password_confirmation').val();
    postUser(username, email, password, password_confirmation);
  })

  function postUser(username, email, password) {
    console.log({username: username, email: email, password: password})
    $.ajax({
      type: "POST",
      url: '/user',
      data: {username: username, email: email, password: password, password_confirmation: password_confirmation},
      dataType: 'html'
    })

  }
})
