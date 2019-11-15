require('minitest/autorun')
require('minitest/reporters')
require_relative('../room.rb')
require_relative('../guest.rb')

MiniTest::Reporters.use! MiniTest::Reporters::SpecReporter.new

class RoomTest < MiniTest::Test

  def setup()
    @room1 = Room.new("Power Ballad Booth")

    @guest = Guest.new("Ian")
  end

  def test_can_create_room_and_get_name()
    assert_equal("Power Ballad Booth", @room1.room_name)
  end

  def test_guest_list_is_empty_at_start()
    assert_equal(0, @room1.count_guests())
  end

end
