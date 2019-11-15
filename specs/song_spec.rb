require('minitest/autorun')
require('minitest/reporters')
require_relative('../song.rb')

MiniTest::Reporters.use! MiniTest::Reporters::SpecReporter.new

class SongTest < MiniTest::Test

  def setup()
    @song = Song.new("Proud Mary", "Tina Turner")
  end

 def test_can_create_song_and_get_title()
   assert_equal("Proud Mary", @song.title)
 end

 def test_can_get_song_artist()
   assert_equal("Tina Turner", @song.artist)
 end

end
