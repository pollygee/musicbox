class Playlist < ActiveRecord::Base
  has_many :playlist_songs
  has_many :songs, through: :playlist_songs

  include Enumerable

  def each
    songs.each do |song|
      yield song
    end
  end
end
