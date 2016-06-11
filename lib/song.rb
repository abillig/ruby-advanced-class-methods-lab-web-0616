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
  # Build a class constructor Song.create that initializes 
  # a song and saves it to the @@all class variable either 
  # literally or through the class method Song.all. This method 
  # should return the song instance that was initialized 
  # and saved.
  new_song = self.new
  @@all << new_song
  new_song
end

def self.new_by_name(name)
# Build a class constructor Song.new_by_name that 
# takes in the string name of a song and returns a 
# song instance with that name set as its name property. 
# Song.new_by_name should return an instance of Song 
# and not a simple string or anything else. 
new_song = self.new
new_song.name = name
new_song
  end

def self.create_by_name(song)
  # Build a class constructor Song.create_by_name that 
  # takes in the string name of a song and returns a song 
  # instance with that name set as its name property and 
  # the song being saved into the @@all class variable.
new_song=self.new 
new_song.name = song
new_song.save
new_song

end

def self.find_by_name(name)
  # Build a class finder Song.find_by_name that accepts the 
  # string name of a song and returns the matching instance 
  # of the song with that name. 
  self.all.find{|song|
    song.name==name}
end

def self.find_or_create_by_name(name)
  # accept a string name for a song and either return a matching 
  # song instance with that name or create a new song with the 
  # name and return the song instance.
if self.find_by_name(name) == nil 
  self.create_by_name(name)
else
  self.find_by_name(name)
end
end

def self.alphabetical
# Build a class method Song.alphabetical 
# that returns all the songs in ascending (a-z) 
# alphabetical order.
self.all.sort_by {|object| object.name}
end

def self.new_from_filename(filename)
# Build a class constructor that accepts a filename in 
# the format of " - .mp3", for example 
# "Taylor Swift - Blank Space.mp3".
# Given Song.new_from_filename("Taylor Swift - Blank Space.mp3"), 
# the constructor should return a new Song instance with the song 
# ame set to Blank Space and the artist_name set to Taylor Swift. 
# The filename input sent to Song.new_from_filename in the format 
#of Taylor Swift - Blank Space.mp3 must be parsed for the relevant 
# components. Separate the artist name from the rest of the data 
# based on the - delimiter. Don't forget that when you parse the 
# song name, you have to remove the '.mp3' part of the string.

new_song = self.new_by_name(filename)
split_file = filename.chomp('.mp3').split(" - ")
new_song.name = split_file[1]
new_song.artist_name = split_file[0] 
new_song
end

def self.create_from_filename(filename)
# Build a class constructor that accepts a filename in the format 
# of " - .mp3", for example "Taylor Swift - Blank Space.mp3". 
# The Song.create_from_filename class method should not only 
# parse the filename correctly but should also save the Song 
# instance that was created.
song = self.new_from_filename(filename)
song.save
end

def self.destroy_all
  # The Song.destroy_all class method should reset the state 
  # of the @@all class variable to an empty array thereby 
  # deleting all previous song instances.
@@all.clear

end

end 


