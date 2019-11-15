require('minitest/autorun')
require('minitest/reporters')
require_relative('../room.rb')
require_relative('../guest.rb')

MiniTest::Reporters.use! MiniTest::Reporters::SpecReporter.new

class RoomTest < MiniTest::Test

  def setup()
    @room1 = Room.new("Power Ballad Booth")

    @guest1 = Guest.new("Ian")
    @guest2 = Guest.new("Amy")
  end

  def test_can_create_room_and_get_name()
    assert_equal("Power Ballad Booth", @room1.room_name)
  end

  def test_guest_list_is_empty_at_start()
    assert_equal(0, @room1.count_guests())
  end

  def test_can_check_guest_into_room()
    @room1.check_in_guest(@guest1)
    assert_equal(1, @room1.count_guests())
  end

  def test_can_check_guest_out_of_room()
    @room1.check_in_guest(@guest1)
    @room1.check_in_guest(@guest2)
    @room1.check_out_guest(@guest1)
    assert_equal(1, @room1.count_guests())
  end

end
