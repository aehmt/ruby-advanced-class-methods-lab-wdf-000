require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end


  def self.create
  	song = self.new
  	song.save
  	song
  end

  def self.new_by_name(song_name)
  	song = self.new
  	song.name = song_name
  	song
  end

  def self.create_by_name(song_name)
  	song = self.new
  	song.name = song_name
  	@@all << song
  	song
  end

  def self.find_by_name(song_name)
  	self.all.detect {|song| song.name == song_name} 
  end

  def self.find_or_create_by_name(song_name)
  	self.find_by_name(song_name)
  	self.create_by_name(song_name)
  end

  def self.alphabetical
  	self.all.sort { |a, b| a.name <=> b.name }
  end

  def self.new_from_filename(file_name)
  	arr = file_name.split(" - ")
  	arr[1] = arr[1].chomp(".mp3")
  	song = self.new
  	song.artist_name = arr[0]
  	song.name = arr[1]
  	song
  end

  def self.create_from_filename(file_name)
  	arr = file_name.split(" - ")
  	arr[1] = arr[1].chomp(".mp3")
  	song = self.new
  	song.artist_name = arr[0]
  	song.name = arr[1]
  	@@all << song
  end

  def self.destroy_all
  	self.all.clear
  end
  	
end


