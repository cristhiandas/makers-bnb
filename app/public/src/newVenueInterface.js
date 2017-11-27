$(document).ready(function(){

  $('#createVenue').click(function(){
    var title = $('#title').val();
    var address = $('#address').val();
    var price = $('#price').val();
    var picture = $('#picture').val();
    postVenue(title, address, price, picture);
  });

  function postVenue(title, address, price, picture){

    console.log(title);
    $.post('/venue',{ title: title, address: address, price: price, picture: picture})
  }

})
