require('minitest/autorun')
require('minitest/reporters')
require_relative('../guest.rb')
require_relative('../song.rb')

MiniTest::Reporters.use! MiniTest::Reporters::SpecReporter.new

class GuestTest < MiniTest::Test

  def setup()
    @guest = Guest.new("Jen", 30, "Rollin In The Deep")

    @song1 = Song.new("Rollin In The Deep", "Adele")
    @song2 = Song.new("In The Air Tonight", "Phil Collins")
  end

  def test_can_create_guest_and_get_name()
    assert_equal("Jen", @guest.name)
  end

  def test_can_get_guest_cash()
    assert_equal(30, @guest.cash)
  end

  def test_can_get_favourite_song()
    assert_equal("Rollin In The Deep", @guest.favourite_song)
  end

  def test_can_remove_guest_cash()
    @guest.remove_cash(3)
    assert_equal(27, @guest.cash)
  end

  def test_cheer_at_favourite_song()
    output = @guest.cheer_at_favourite_song(@song1)
    assert_equal("Woohoo!", output)
  end

  def test_cheer_at_favourite_song__wrong_song()
    output = @guest.cheer_at_favourite_song(@song2)
    assert_nil(output)
  end

end
