class Room

  attr_reader :room_name

  def initialize(room_name)
    @room_name = room_name
    @guests = []
  end

  def count_guests()
    return @guests.length()
  end

  def check_in_guest(guest)
    @guests.push(guest)
  end

  def check_out_guest(guest)
    @guests.delete(guest)
  end

#
end
