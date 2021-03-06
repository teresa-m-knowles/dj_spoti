class JoinController < ApplicationController
  def show
    if session[:party_identifier]
      if !Party.find_by(identifier: session[:party_identifier])
        session[:party_identifier] = nil
        redirect_to spotify_omniauth_path(url: params[:i])
      else
        redirect_to dashboard_path, alert: "Please Leave The Current Party And Click The Invitation Link Again."
      end
    else
      redirect_to spotify_omniauth_path(url: params[:i])
    end
  end
end
