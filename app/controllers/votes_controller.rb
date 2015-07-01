class VotesController < ApplicationController
  def new
    if current_user.votes_left > 0
      song = Song.find_by_title(params[:song_title])
      Vote.create! voter_id: current_user.id, song_id: song.id, value: params[:value]
      vl = current_user.votes_left
      current_user.update(votes_left: vl -= 1)
    else
      flash[:alert] "You are out of votes!"
      status 400
    end
    redirect to ("/")
  end
end