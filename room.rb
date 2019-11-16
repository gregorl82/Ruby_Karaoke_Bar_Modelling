
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

  def check_out_guest(guest_name)
    guest = find_guest_by_name(guest_name)
    guest.settle_tab()
    @guests.delete(guest)
  end

  def count_playlist()
    return @playlist.length()
  end

  def add_song_to_playlist(song)
    @playlist.push(song)
  end

  def find_guest_by_name(guest_name)
    for guest in @guests
      if guest.name == guest_name
        return guest
      end
    end
  end

  def add_to_guest_tab(amount, guest_name)
    guest = find_guest_by_name(guest_name)
    guest.add_to_tab(amount)
  end

  def calculate_total_tab()
    guest_tabs = @guests.map { |guest| guest.tab }
    total = guest_tabs.reduce(0) { |total, tab_value| total + tab_value }
    @total_tab = total
  end

#
end
