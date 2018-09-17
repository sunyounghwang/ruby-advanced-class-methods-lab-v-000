class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def create
    new_song = self.new
    self.class.all << new_song
    new_song

  end

  def save
    self.class.all << self
  end
end
