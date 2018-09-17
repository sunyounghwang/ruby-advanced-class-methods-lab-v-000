require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
    self
  end

  def self.create
    self.new.save
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    new_by_name(name).save
  end

  def self.find_by_name(name)
    all.each do |song|
      return song if song.name == name
    end
    nil
  end

  def self.find_or_create_by_name(name)
    unless find_by_name(name)
      create_by_name(name)
    else
      find_by_name(name)
    end
  end

  def self.alphabetical
    all.sort_by { |song| song.name }
  end

  def self.new_from_filename(filename)
    song_array = filename.split(" - ")
    song = self.new
    song.artist_name = song_array[0]
    song.name = song_array[1].slice[-4, song_array[1].length]
    song
  end
end
