class SongsController < ApplicationController
  # FIXME
  skip_before_filter :verify_authenticity_token

  def index
    @songs = Song.all
  end

  def new
    spotify_token = current_user.spotify_data["credentials"]["token"]
    spot = SpotifyAPI.new (spotify_token)
    spot_track = spot.get_track params[:artist], params[:title]
    if spot_track
      uri = spot_track[1]
      if true #current_user.num_of_songs_suggested_this_week <= 4 
        song = Song.where(
          artist:       params[:artist],
          title:        params[:title],
          user_id: current_user.id,
          uri:          uri
        ).first_or_create!
        current_user.votes.create! song: song, value: 1
      else
        set_message "You have submitted too many songs this week. Try again later."
      end
    else
      set_message "No song found, please try again."
    end
    redirect_to("/")
  end

  def show
    @song = Song.find(params[:id])
  end

  def letter
        results = []

    Song.all.each do |song|
      if song.title.downcase.start_with? params[:letter].downcase
        song_as_hash = {
          artist:       song.artist,
          title:        song.title,
          vote_count:   song.total_votes,
          spotify_uri:  song.uri,
          suggested_by: song.suggester.name
        }

        results.push song_as_hash
      end
    end

    sorted_results = results.sort_by { |h| h[:vote_count] }
    unless params[:sort].to_s.downcase == "asc"
      sorted_results.reverse!
    end
    return sorted_results.to_json
  end

end