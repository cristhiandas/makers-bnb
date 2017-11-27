$(document).ready(function() {
  $('#sign_up').click(function() {
    var username = $('#username').val();
    var email = $('#email').val();
    var password = $('#password').val();
    postUser(username, email, password);
  })
  function postUser(username, email, password) {
    $.post('/user', {username: username, email: email, password: password}, function(data) {
    })
  }
})
