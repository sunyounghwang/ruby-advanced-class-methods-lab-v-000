class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def create
    self.class.all << self.new
  end

  def save
    self.class.all << self
  end
end
