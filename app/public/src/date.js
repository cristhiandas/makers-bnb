 $(document).ready(function(){

  $( function() {
    $( "#startDate" ).datepicker({dateFormat: 'dd-mm-yy'});
    $( "#endDate" ).datepicker({dateFormat: 'dd-mm-yy'});

  });

  function postDate(startDate, endDate){
    $.post('/view/:name',{startDate: startDate, endDate: endDate});
  };

  $( function() {
    $("#startDate").on("change",function(){
      var startDate = $(this).val();
      $("#endDate").on("change",function(){
        var endDate = $(this).val();
        $("#book").click(function(){
          postDate(startDate, endDate);
        });
      });
    });
  });

});
