require('minitest/autorun')
require('minitest/reporters')
require_relative('../room.rb')
require_relative('../guest.rb')
require_relative('../song.rb')

MiniTest::Reporters.use! MiniTest::Reporters::SpecReporter.new

class RoomTest < MiniTest::Test

  def setup()
    @room1 = Room.new("Power Ballad Booth", 5)

    @guest1 = Guest.new("Ian")
    @guest2 = Guest.new("Amy")
    @guest3 = Guest.new("Alistair")
    @guest4 = Guest.new("Cameron")
    @guest5 = Guest.new("Adele")
    @guest6 = Guest.new("Kate")

    @song1 = Song.new("Don't Stop Believin'", "Journey")
    @song2 = Song.new("We Are The Champions", "Queen")
    @song3 = Song.new("Alone", "Heart")
  end

  def test_can_create_room_and_get_name()
    assert_equal("Power Ballad Booth", @room1.room_name)
  end

  def test_guest_list_is_empty_at_start()
    assert_equal(0, @room1.count_guests())
  end

  def test_playlist_is_empty_at_start()
    assert_equal(0, @room1.count_playlist())
  end

  def test_can_get_room_capacity()
    assert_equal(5, @room1.capacity)
  end

  def test_can_check_guest_into_room()
    @room1.check_in_guest(@guest1)
    assert_equal(1, @room1.count_guests())
  end

  def test_can_check_guest_into_room__too_many_guests()
    @room1.check_in_guest(@guest1)
    @room1.check_in_guest(@guest2)
    @room1.check_in_guest(@guest3)
    @room1.check_in_guest(@guest4)
    @room1.check_in_guest(@guest5)
    output = @room1.check_in_guest(@guest6)
    assert_equal(5, @room1.count_guests())
    assert_equal("Room full!", output)
  end

  def test_can_check_guest_out_of_room()
    @room1.check_in_guest(@guest1)
    @room1.check_in_guest(@guest2)
    @room1.check_out_guest(@guest1)
    assert_equal(1, @room1.count_guests())
  end

  def test_can_add_song_to_playlist()
    @room1.add_song_to_playlist(@song1)
    assert_equal(1, @room1.count_playlist())
  end

end
