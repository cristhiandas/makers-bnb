$(document).ready(function() {
  $('#sign_up').click(function() {
    var username = $('#username').val();
    var email = $('#email').val();
    var password = $('#password').val();
    postUser(username, email, password);
  })

  function postUser(username, email, password) {
    console.log({username: username, email: email, password: password})
    $.ajax({
      type: "POST",
      url: '/user',
      data: {username: username, email: email, password: password},
      dataType: 'html'
    })

  }
})
