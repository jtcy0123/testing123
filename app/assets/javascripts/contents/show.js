$(document).on('turbolinks:load', function() {
  var totalContents = JSON.parse($('#contentLength').text())
  for (i = 0; i < totalContents.length; i++) {
    $('#showComment'+ totalContents[i]).css("display", "none")
    $('#commentBtn'+ totalContents[i]).on('click', function() {
      event.preventDefault()
      $(this).next().css("display","block")
    })
  }

  $('#signupBtn').click(function() {
    $('.close').trigger("click")
  })

  $('#loginBtn').click(function() {
    $('.close').trigger("click")
  })
})