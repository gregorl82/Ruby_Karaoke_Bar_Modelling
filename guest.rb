class Guest

  attr_reader :name, :cash, :favourite_song

  def initialize(name, cash, favourite_song)
    @name = name
    @cash = cash
    @favourite_song = favourite_song
  end

  def remove_cash(amount)
    @cash -= amount
  end

  def cheer_at_favourite_song(playlist)
    playlist.each do |song|
      if (@favourite_song == song.title)
        return "Woohoo!"
      end
    end
    return nil
  end

end
