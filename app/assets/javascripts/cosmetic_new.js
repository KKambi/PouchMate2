$('#big-select').on('change', function() {
  var category_id = $(this).val();

  $.ajax({
    url: "/cosmetics/" + category_id + "/get_middle_categories", 
    type: "GET",
    data: { "category_id": category_id },
    dataType: "script", 
    // error: function(jqXHR){
    //   alert(jqXHR.responseText);
    // }
  });
});

$('#middle-category').on('change', function() {
  var category_id = $('#middle-select').val();

  $.ajax({
    url: "/cosmetics/" + category_id + "/get_small_categories", 
    type: "GET",
    data: { "category_id": category_id },
    dataType: "script", 
    // error: function(jqXHR){
    //   console.log(jqXHR.responseText);
    // }
  });
});