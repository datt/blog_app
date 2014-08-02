
$(document).ready(function() {
  $(document).on("submit", "#new_comment", function(e) {
    $.ajax({
      url: $(this).attr('action'),
      data: $(this).serialize(),
      dataType: "json",
      method: "POST",
      success: function(response) {
        console.log("test json request: JSON response", response);
        ghtml = Mustache.to_html($("#commentTemplate").html(), response);
        console.log("test json request: generated html", ghtml);
        $(".allComments").html(ghtml);
      }
    });
    $("#new_comment")[0].reset();
    return false;
  });
});