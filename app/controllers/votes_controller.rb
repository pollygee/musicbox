class VotesController < ApplicationController
  def new
    if current_user.votes_left > 0
      song = Song.find_by_title(params[:song_title])
      Vote.create! user_id: current_user.id, song_id: song.id, value: params[:value]
      vl = current_user.votes_left
      current_user.update(votes_left: vl -= 1)
      render json: song.total_votes 
    else
      render json: {status: :ok}
    end
  end
end