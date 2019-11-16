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
    @song3 = Song.new("Super Trooper", "ABBA")

    @playlist1 = [@song1, @song2]
    @playlist2 = [@song2, @song3]
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

  def test_guest_tab_is_zero_at_start()
    assert_equal(0, @guest.tab)
  end

  def test_can_remove_guest_cash()
    @guest.remove_cash(3)
    assert_equal(27, @guest.cash)
  end

  def test_add_to_guest_tab()
    @guest.add_to_tab(5)
    assert_equal(5, @guest.tab)
  end

  def test_add_to_guest_tab__not_enough_cash()
    output = @guest.add_to_tab(31)
    assert_equal("Not enough cash to cover tab!", output)
    assert_equal(0, @guest.tab)
  end

  def test_cheer_at_favourite_song()
    output = @guest.cheer_at_favourite_song(@playlist1)
    assert_equal("Woohoo!", output)
  end

  def test_cheer_at_favourite_song__wrong_song()
    output = @guest.cheer_at_favourite_song(@playlist2)
    assert_nil(output)
  end

end
