class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def spotify
    current_user.update(spotify_data: auth_data)
    redirect_to root_path, notice: "You have now linked your Spotify account."
  end


private
  def auth_data
    request.env["omniauth.auth"]
  end

end