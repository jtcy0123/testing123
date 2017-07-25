$(document).on("turbolinks:load", function(){
  

  $(".clickcount").on("click", function(){
    event.preventDefault()
    contentId = $(this).attr('data-cid');
    $.ajax({
      url: "/contents/" + contentId + "/click",
      type: "post",
      success: function(data){
        debugger
      }
    })
  })
})