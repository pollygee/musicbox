var voteHandler = function() {
   var $song = $(this).data("song-title")
   var $vote_value = $(this).data("vote-value")
   var $vote_count = $(this).siblings(".voter")
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
    success: function(data) {
      if (typeof data === 'number') {
        $vote_count.text(data)}
      else {
        alert("You are out of votes sucker!")
      }}
  })
 }

$(document).on("ready", function() {
  $(".upvote").on("click", voteHandler) 
  $(".downvote").on("click", voteHandler)
}) 