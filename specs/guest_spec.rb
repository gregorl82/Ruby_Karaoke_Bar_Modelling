require('minitest/autorun')
require('minitest/reporters')
require_relative('../guest.rb')

MiniTest::Reporters.use! MiniTest::Reporters::SpecReporter.new

class GuestTest < MiniTest::Test

  def setup()
    @guest = Guest.new("Jen")
  end

  def test_can_create_guest_and_get_name()
    assert_equal("Jen", @guest.name)
  end

end
