$(document).on('turbolinks:load', function() {
  var array = $('#contentLength').text()
  if(array !== "") {
    var totalContents = JSON.parse(array);
    for (i = 0; i < totalContents.length; i++) {
      $('#showComment'+ totalContents[i]).css("display", "none")
      $('#commentBtn'+ totalContents[i]).on('click', function() {
        event.preventDefault()
        $(this).next().css("display","block")
      })
    }
  }

  $('#signupBtn').click(function() {
    $('.close').trigger("click")
  })

  $('#loginBtn').click(function() {
    $('.close').trigger("click")
  })
})