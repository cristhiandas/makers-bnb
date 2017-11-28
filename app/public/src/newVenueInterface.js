$(document).ready(function(){

  $('#createVenue').click(function(){
    var title = $('#title').val();
    var address = $('#address').val();
    var price = $('#price').val();
    var picture = $('#picture').val();
    var description = $('#description').val();
    postVenue(title, address, price, picture, description);
  });

  function postVenue(title, address, price, picture, description){

    console.log(title);
    $.post('/venue',{ title: title, address: address, price: price, picture: picture, description: description})
  }

})
