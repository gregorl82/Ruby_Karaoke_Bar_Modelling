class Room

  attr_reader :room_name, :capacity

  def initialize(room_name, capacity)
    @room_name = room_name
    @guests = []
    @playlist = []
    @capacity = capacity
  end

  def count_guests()
    return @guests.length()
  end

  def check_in_guest(guest)
    if count_guests() < @capacity
      @guests.push(guest)
    else
      return "Room full!"
    end
  end

  def check_out_guest(guest)
    @guests.delete(guest)
  end

  def count_playlist()
    return @playlist.length()
  end

  def add_song_to_playlist(song)
    @playlist.push(song)
  end

#
end
