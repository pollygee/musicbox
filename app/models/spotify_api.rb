class SpotifyAPI
  include HTTParty
  base_uri 'https://api.spotify.com'

  # default_options[:headers] = 
  #   "Authorization" => "token #{Token}",
  #   "User-Agent"    => "Wandows Explrer"
  # }

  def initialize given_token
     @headers = { "Authorization" => "Bearer #{given_token}", "User-Agent" => "Wandows Explorer" }
  end

  def get_track artist, track

    s = SpotifyAPI.get("/v1/search", headers: @headers, query: { q: "artist:#{artist} + track:#{track}", type: "track"}) 
    binding.pry
    if s
      track_list = s["tracks"]["items"].map { |track| track.values_at("name", "uri") }
      track_list.first
    end
  end
end
