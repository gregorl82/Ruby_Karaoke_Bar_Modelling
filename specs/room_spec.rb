require('minitest/autorun')
require('minitest/reporters')
require_relative('../room.rb')
require_relative('../guest.rb')
require_relative('../song.rb')

MiniTest::Reporters.use! MiniTest::Reporters::SpecReporter.new

class RoomTest < MiniTest::Test

  def setup()

    # Create new Room object
    @room1 = Room.new("Power Ballad Booth", 5)

    # Create new Guest objects
    @guest1 = Guest.new("Ian", 15, "We Are The Champions")
    @guest2 = Guest.new("Amy", 42, "Wind Of Change")
    @guest3 = Guest.new("Alistair", 20, "Can't Fight This Feeling")
    @guest4 = Guest.new("Cameron", 50, "Angels")
    @guest5 = Guest.new("Adele", 25, "Feelin' Good")
    @guest6 = Guest.new("Kate", 20, "All Out Of Love")

    # Create new Song objects
    @song1 = Song.new("Don't Stop Believin'", "Journey")
    @song2 = Song.new("We Are The Champions", "Queen")
    @song3 = Song.new("Show Me Heaven", "Maria McKee")
    @song4 = Song.new("Alone", "Heart")
    @song5 = Song.new("Kayleigh", "Marillion")
    @song6 = Song.new("Who Wants To Live Forever?", "Queen")
  end

  # Tests for attributes created at initialization

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

  def test_can_get_entry_fee()
    assert_equal(3, @room1.entry_fee)
  end

  def test_can_modify_entry_fee()
    @room1.entry_fee = 5
    assert_equal(5, @room1.entry_fee)
  end

  def test_total_tab_is_zero_at_start()
    assert_equal(0, @room1.total_tab)
  end

  # Tests for checking guests in and out of room

  def test_check_guest_into_room_and_charge_entry()
    @room1.check_in_guest(@guest1)
    assert_equal(1, @room1.count_guests())
    assert_equal(12, @guest1.cash)
  end

  def test_check_guest_into_room__too_many_guests()
    @room1.check_in_guest(@guest1)
    @room1.check_in_guest(@guest2)
    @room1.check_in_guest(@guest3)
    @room1.check_in_guest(@guest4)
    @room1.check_in_guest(@guest5)
    output = @room1.check_in_guest(@guest6)
    assert_equal("Room full!", output)
  end

  def test_can_check_guest_out_of_room()
    @room1.check_in_guest(@guest1)
    @room1.check_in_guest(@guest2)
    @room1.check_out_guest(@guest1)
    assert_equal(1, @room1.count_guests())
  end

  # Tests for song related functionality

  def test_can_add_song_to_playlist()
    @room1.add_song_to_playlist(@song1)
    assert_equal(1, @room1.count_playlist())
  end

  def test_guest_cheers_when_favourite_song_is_in_playlist()
    @room1.add_song_to_playlist(@song2)
    output = @room1.check_in_guest(@guest1)
    assert_equal("Woohoo!", output)
  end

  # Tests for functions that modify guest tabs and total_tab

  def test_add_to_guest_tab_by_name()
    @room1.check_in_guest(@guest1)
    @room1.add_to_guest_tab(4.5, "Ian")
    assert_equal(4.5, @guest1.tab)
  end

  def test_return_guest_tab_by_name()
    @room1.check_in_guest(@guest1)
    @room1.check_in_guest(@guest2)
    @room1.add_to_guest_tab(1.8, "Amy")
    @room1.add_to_guest_tab(2.2, "Ian")
    @room1.calculate_total_tab()
    assert_equal(4, @room1.total_tab)
  end

end
