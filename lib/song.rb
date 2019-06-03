class Song 
  attr_accessor :name, :artist
  
  def initialize(name)
    @name = name
  end
 
  
  def self.new_by_filename(filename)
    file_array = filename.split(" - ")
    new_song = Song.new(file_array[1])
    #make a new song from the parsed filename
    artist = Artist.find_or_create_by_name(file_array[0])
    #use info from parsed filename to find artist
    new_song.artist = artist
    new_song
    #associate the newly created song with the found or created artist
    artist.add_song(new_song)
  end
  
   
  
   def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    #after the artist instance is returned
    #this method calls the artist instance method #add_song
    #add_song adds this current song instance to the artist's song list
    self.artist.add_song(self)
  end
  
  
end