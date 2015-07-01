class PlaylistsController < ApplicationController
  def new
    @playlist = Playlist.create!
    Song.by_sort_letter.each do |letter, songs|
      next unless songs
      winner = songs.max_by { |s| s.total_votes }
      @playlist.songs << winner
    end
  end

  def show
     @playlist = Playlist.order(created_at: :asc).last
  end
end