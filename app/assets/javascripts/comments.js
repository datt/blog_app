
$(document).ready(function() {
  $(document).on("submit", "#new_comment", function(e) {
    $.ajax({
      url: $(this).attr('action'),
      data: $(this).serialize(),
      dataType: "json",
      method: "POST",
      complete: function(response) {
        console.log("test json request: JSON response", response.responseJSON)
      }
    });
  });
});