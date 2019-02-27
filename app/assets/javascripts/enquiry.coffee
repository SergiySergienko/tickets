$(document).ready ->
  $(document).on("ajax:success", (event, data, status, xhr) ->
    $("#error_explanation").html('');
    commentMessage = JSON.parse(xhr.responseText).message
    $("#comments-wrapper").append "<p>#{commentMessage}</p>"
  ).on "ajax:error", (event, xhr, status, error) ->
  # TODO: Parse validation errors json and display on pretty format
    $("#error_explanation").html "<p>#{xhr.responseText}</p>"