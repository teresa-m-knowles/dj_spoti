class SpotifyService
  def initialize(token)
    @token = token
  end

  def currently_playing
    json_for('me/player/currently-playing')
  end

  def json_for(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'https://api.spotify.com/v1/') do |f|
      f.headers['Authorization'] = "Bearer #{@token}"
      f.adapter Faraday.default_adapter
    end
  end
end
