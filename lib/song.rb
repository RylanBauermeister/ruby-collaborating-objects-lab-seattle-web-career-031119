require "pry"
class Song
  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(file)
    song_data = file.split(/\s-\s|\./)
    song = Song.new(song_data[1])
    song.artist = Artist.find_or_create_by_name(song_data[0])
    song.artist.add_song(song)
    song
  end

end
