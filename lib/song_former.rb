require 'pry'

class Song
  attr_accessor :name, :artist_name, :save
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

#initializes a song and saves it to the @@all class variable

  def self.create
    new_song = Song.new
    new_song.save
    new_song
  end

  def self.new_by_name(song_name)
#takes in the string name of a song and returns a 
#song instance with that name set as its name property.
new_song = self.create
new_song.name = song_name
new_song
  end

  def self.create_by_name(song_name)
    # Build a class constructor Song.create_by_name that 
    # takes in the string name of a song and returns a song 
    # instance with that name set as its name property and the 
    # song being saved into the @@all class variable.
    new_song = self.new_by_name(song_name)
    new_song.save
    new_song
  end

  def self.find_by_name(song_name)
    # Build a class finder Song.find_by_name that accepts the 
    # string name of a song and returns the matching instance 
    # of the song with that name. 
    found = self.all.find {|song| 
      song.name==song_name}
end

def self.find_or_create_by_name(song_name)
 # accept a string name for a song and either return a matching 
 # song instance with that name or create a new song with the 
 # name and return the song instance
 self.find_by_name(song_name) unless self.find_by_name(song_name) == nil 
 self.create_by_name(song_name) if self.find_by_name(song_name) == nil

end


end
