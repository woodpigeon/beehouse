

$(function(){

  $('#tubesStep #tubes').sortable({

    update: function() {

      $(this).children(".tube").each(function(index) {
        $(this).children('input.tube_position').val(index + 1);

      });
    }
  });

  $('#materialsList li a').click(function(e) {

    e.preventDefault();
    $('#materialsList li a').removeClass("selected");
    $(this).addClass("selected");

  });

  $("#materialsStep #tubes li a").click(function(e) {

    e.preventDefault();
    var modal = $('#materialModal');
    
    index = $(this).parent("li").data("index");
    var current_material = $(this).data("bee-code");
    
    $(modal).find("#materialsList a").removeClass("selected");
    if (current_material == null) {
      $(modal).find("#materialsList a[data-bee-code=empty]").addClass("selected");
    } else {
      $(modal).find("#materialsList a[data-bee-code=" + current_material +"]").addClass("selected");
    }
    console.log($(this));
    $(modal).data("tube-index", index);
    $(modal).modal('show');

  });


  $('#materialModal button.save').click(function() {

    $('#materialModal').modal('hide');

    // grab the selected material/bee_code 
    var bee_code = $('#materialsList li a.selected').data('bee-code');

    // which tube are we talking about? - get its index
    index = $('#materialModal').data("tube-index");

    // update the hidden input generated by fields_for so the value gets posted back
    $("#house_tubes_attributes_" + index + "_bee_code").val(bee_code)

    // set the class on the anchor inside the tube li so it displays the correct material
    $("#tubes li[data-index=" + index + "] a")
      .removeClass("mud")
      .removeClass("leaf")
      .removeClass("empty")
      .addClass(bee_code)
      .data("bee_code", bee_code);
   
    
  });

  $("#materialModal").appendTo($("body"));

});

