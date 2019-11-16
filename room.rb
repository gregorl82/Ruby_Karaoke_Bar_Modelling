class Room

  attr_reader :room_name, :capacity, :total_tab
  attr_accessor :entry_fee

  def initialize(room_name, capacity)
    @room_name = room_name
    @guests = []
    @playlist = []
    @capacity = capacity
    @entry_fee = 3
    @total_tab = 0
  end

  def count_guests()
    return @guests.length()
  end

  def check_in_guest(guest)
    if count_guests() < @capacity
      guest.remove_cash(@entry_fee)
      @guests.push(guest)
      guest.cheer_at_favourite_song(@playlist)
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
