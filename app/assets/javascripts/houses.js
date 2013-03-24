

$(function(){
  $('#tubes').sortable({
    update: function() {

      $(this).children(".tube").each(function(index) {
        $(this).children('input.tube_position').val(index + 1);

      });
    }
  });


});

