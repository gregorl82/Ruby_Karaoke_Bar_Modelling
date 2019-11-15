require('minitest/autorun')
require('minitest/reporters')
require_relative('../room.rb')

MiniTest::Reporters.use! MiniTest::Reporters::SpecReporter.new

class RoomTest < MiniTest::Test

  def setup()
    @room1 = Room.new("Power Ballad Booth")
  end

  def test_can_create_room_and_get_name()
    assert_equal("Power Ballad Booth", @room1.room_name)
  end

end
