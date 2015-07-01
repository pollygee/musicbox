class SpotifyAPI
  include HTTParty
  base_uri 'https://api.spotify.com'

  # default_options[:headers] = 
  #   "Authorization" => "token #{Token}",
  #   "User-Agent"    => "Wandows Explrer"
  # }

  def initialize given_token=nil
    @headers = { "User-Agent" => "Wandows Explorer" }
    @headers["Authorization"] = "Bearer #{given_token}" if given_token
  end

  def get_track artist, track

    s = SpotifyAPI.get("/v1/search", headers: @headers, query: { q: "artist:#{artist} + track:#{track}", type: "track"}) 
    if s
      track_list = s["tracks"]["items"].map { |track| track.values_at("name", "uri") }
      track_list.first
    end
  end
end
