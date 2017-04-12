module SpotifyWidget
  def self.playlist
    RSpotify::authenticate("2e0742e78f0a4e55851b45fac1a9386d", "b5a8b72c26c347a6ab710df2dbd6509b")
    playlist = RSpotify::Playlist.find('angela_marshall', '3i4b3uZdFXInaqiZhZxdij')
  end
end


