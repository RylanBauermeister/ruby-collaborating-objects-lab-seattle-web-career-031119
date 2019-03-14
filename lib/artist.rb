class Artist

  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    songs << song
  end

  def save
    @@all << self
  end

  def print_songs
    songs.each do |song|
      puts song.name
    end
  end

  def self.find_or_create_by_name(name)
    result = @@all.find{|person| person.name == name}
    if result.nil?
      artist = Artist.new(name)
      artist.save
      artist
    else
      result
    end
  end

  def self.all
    @@all
  end

end
