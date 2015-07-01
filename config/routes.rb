Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }

  root 'songs#index'
    #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase
  post "/suggest_song"   => "songs#new",      as: :new_song
  get  "/about_song/:id" => "songs#show",     as: :song
  get  "/songs/:letter"  => "songs#letter",    as: :song_letter
  
  post "/vote"           => "votes#new",      as: :new_vote
  
  post "/playlist"       => "playlists#new",  as: :new_playlist
  get  "/playlist"       => "playlists#show", as: :playlist

end
