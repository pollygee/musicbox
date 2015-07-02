var voteHandler = function() {
   var $song = $(this).data("song-title")
   var $vote_value = $(this).data("vote-value")
   console.log($song)
   $.ajax("/vote", {
    type: "POST",
    data: {
      value: $vote_value, 
      song_title: $song
    },
    error: function(data){
        //get the status code
        console.log(data)
      },
    success: function() {alert("something went right")}
  })

$(document).on("ready", function() {
  $(".upvote").on("click", voteHandler) 
  $("#downvote").on("click", voteHandler)
}) 