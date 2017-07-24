$(document).on('turbolinks:load', function() {
  var totalContents = $('#contentLength').text()
  for (i = 1; i <= totalContents; i++) {
    $('#showComment'+ i).css("display", "none")
    $('#commentBtn'+ i).on('click', function() {
      event.preventDefault()
      $(this).next().css("display","block")
    })
  }
})