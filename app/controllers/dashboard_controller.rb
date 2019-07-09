class DashboardController < ApplicationController
  before_action :require_user!
  def index
    render locals: {
      facade: SongFacade.new(current_user)
    }
    @users = current_party.users if current_party
    if current_party
      current_song = SongFacade.new(current_party.admin).current_song
      if current_song
        TrackBroadcastJob.perform_later(current_party.identifier, current_song.serialize_data)
      end
    end

  end
end
