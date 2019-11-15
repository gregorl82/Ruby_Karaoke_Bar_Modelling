class Room

  attr_reader :room_name

  def initialize(room_name)
    @room_name = room_name
    @guests = []
  end

  def count_guests()
    return @guests.length()
  end

#
end
